<?php

namespace App\Http\Controllers\Admin;

use App\CPU\BackEndHelper;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\Seller;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Rap2hpoutre\FastExcel\FastExcel;
use App\Model\Receipt;
use App\Model\Expenses;
use App\Model\Cashdeposit;

class OrderReportController extends Controller
{
    public function order_list(Request $request)
    {
        $seller_id = $request->seller_id ?? 'all';
        $date_type = $request->date_type ?? 'this_year';
        $from = $request->from;
        $to = $request->to;
        $search = $request->search;
        $query_param = ['seller_id'=>$seller_id, 'search' => $request->search, 'date_type' => $date_type, 'from' => $from, 'to' => $to];
        $sellers = Seller::where(['status'=>'approved'])->get();

        $chart_data = self::order_report_chart_filter($request);

        $orders = self::all_order_table_data_filter($request);
        $orders = $orders->latest('updated_at')->paginate(Helpers::pagination_limit())->appends($query_param);

        $ongoing_order_query = Order::whereIn('order_status',['out_for_delivery','processing','confirmed', 'pending']);
        $ongoing_order = self::order_count($request, $ongoing_order_query);

        $cancel_order_query = Order::whereIn('order_status',['canceled','failed','returned']);
        $canceled_order = self::order_count($request, $cancel_order_query);

        $delivered_order_query = Order::where('order_status','delivered');
        $delivered_order = self::order_count($request, $delivered_order_query);

        $order_count = array(
            'ongoing_order'=>$ongoing_order,
            'canceled_order'=>$canceled_order,
            'delivered_order'=>$delivered_order,
            'total_order'=>$canceled_order+$ongoing_order+$delivered_order,
        );

        $due_amount_order_query = Order::whereNotIn('order_status', ['delivered', 'canceled', 'returned', 'failed'])
            ->when($seller_id != 'all', function ($query) use ($seller_id) {
                $query->when($seller_id == 'inhouse', function ($q) {
                    $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
                })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                    $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
                });
            });
        $due_amount = self::date_wise_common_filter($due_amount_order_query, $date_type, $from, $to)->sum('order_amount');

        $settled_amount_query = Order::where('order_status','delivered')
            ->when($seller_id != 'all', function ($query) use ($seller_id) {
                $query->when($seller_id == 'inhouse', function ($q) {
                    $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
                })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                    $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
                });
            });
        $settled_amount = self::date_wise_common_filter($settled_amount_query, $date_type, $from, $to)->sum('order_amount');

        $digital_payment_query = Order::where(['order_status' => 'delivered'])->whereNotIn('payment_method', ['cash', 'cash_on_delivery', 'pay_by_wallet', 'offline_payment']);
        $digital_payment = self::pie_chart_common_query($request, $digital_payment_query)->sum('order_amount');

        $cash_payment_query = Order::where(['order_status' => 'delivered'])->whereIn('payment_method', ['cash', 'cash_on_delivery']);
        $cash_payment = self::pie_chart_common_query($request, $cash_payment_query)->sum('order_amount');

        $wallet_payment_query = Order::where(['order_status' => 'delivered'])->where(['payment_method' => 'pay_by_wallet']);
        $wallet_payment = self::pie_chart_common_query($request, $wallet_payment_query)->sum('order_amount');

        $offline_payment_query = Order::where(['payment_method' => 'offline_payment']);
        $offline_payment = self::pie_chart_common_query($request, $offline_payment_query)->sum('order_amount');

        $total_payment = $cash_payment + $wallet_payment + $digital_payment + $offline_payment;

        $payment_data = [
            'total_payment' => $total_payment,
            'cash_payment' => $cash_payment,
            'wallet_payment' => $wallet_payment,
            'offline_payment' => $offline_payment,
            'digital_payment' => $digital_payment,
        ];

        return view('admin-views.report.order-index', compact('orders', 'order_count', 'payment_data', 'chart_data', 'due_amount', 'settled_amount', 'sellers', 'seller_id', 'search', 'date_type', 'from', 'to'));
    }

    public function cashbook(Request $request)
    {
        // $seller_id = $request->seller_id ?? 'all';
        $date_type = $request->date_type ?? 'custom_date';
        $from = $request->from;
        $to = $request->to;
        if(!$from){
            $from = Carbon::now()->toDateString();
        }
        if(!$to){
            $to = Carbon::now()->toDateString();
        }
        
        // $search = $request->search;
        // $query_param = ['search' => $request->search, 'date_type' => $date_type, 'from' => $from, 'to' => $to];

        // $date_type = $request->input('date_type', 'today');
        // $from = $request->input('from');
        // $to = $request->input('to');
        // $sellers = Seller::where(['status'=>'approved'])->get();

        // $chart_data = self::order_report_chart_filter($request);

        // $orders = self::all_order_table_data_filter($request);
        // $orders = $orders->latest('updated_at')->paginate(Helpers::pagination_limit())->appends($query_param);

        // $ongoing_order_query = Order::whereIn('order_status',['out_for_delivery','processing','confirmed', 'pending']);
        // $ongoing_order = self::order_count($request, $ongoing_order_query);

        // $cancel_order_query = Order::whereIn('order_status',['canceled','failed','returned']);
        // $canceled_order = self::order_count($request, $cancel_order_query);

        // $delivered_order_query = Order::where('order_status','delivered');
        // $delivered_order = self::order_count($request, $delivered_order_query);

        // $order_count = array(
        //     'ongoing_order'=>$ongoing_order,
        //     'canceled_order'=>$canceled_order,
        //     'delivered_order'=>$delivered_order,
        //     'total_order'=>$canceled_order+$ongoing_order+$delivered_order,
        // );

        // $due_amount_order_query = Order::whereNotIn('order_status', ['delivered', 'canceled', 'returned', 'failed'])
        //     ->when($seller_id != 'all', function ($query) use ($seller_id) {
        //         $query->when($seller_id == 'inhouse', function ($q) {
        //             $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
        //         })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
        //             $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
        //         });
        //     });
        // $due_amount = self::date_wise_common_filter($due_amount_order_query, $date_type, $from, $to)->sum('order_amount');

        // $settled_amount_query = Order::where('order_status','delivered')
        //     ->when($seller_id != 'all', function ($query) use ($seller_id) {
        //         $query->when($seller_id == 'inhouse', function ($q) {
        //             $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
        //         })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
        //             $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
        //         });
        //     });
        // $settled_amount = self::date_wise_common_filter($settled_amount_query, $date_type, $from, $to)->sum('order_amount');

        // $digital_payment_query = Order::where(['order_status' => 'delivered'])->whereNotIn('payment_method', ['cash', 'cash_on_delivery', 'pay_by_wallet', 'offline_payment']);
        // $digital_payment = self::pie_chart_common_query($request, $digital_payment_query)->sum('order_amount');

        // $cash_payment_query = Order::where(['order_status' => 'delivered'])->whereIn('payment_method', ['cash', 'cash_on_delivery']);
        // $cash_payment = self::pie_chart_common_query($request, $cash_payment_query)->sum('order_amount');

        // $wallet_payment_query = Order::where(['order_status' => 'delivered'])->where(['payment_method' => 'pay_by_wallet']);
        // $wallet_payment = self::pie_chart_common_query($request, $wallet_payment_query)->sum('order_amount');

        // $offline_payment_query = Order::where(['payment_method' => 'offline_payment']);
        // $offline_payment = self::pie_chart_common_query($request, $offline_payment_query)->sum('order_amount');

        // $total_payment = $cash_payment + $wallet_payment + $digital_payment + $offline_payment;

        // $payment_data = [
        //     'total_payment' => $total_payment,
        //     'cash_payment' => $cash_payment,
        //     'wallet_payment' => $wallet_payment,
        //     'offline_payment' => $offline_payment,
        //     'digital_payment' => $digital_payment,
        // ];

        // return view('admin-views.report.cashbook', compact('orders', 'order_count', 'payment_data', 'chart_data', 'due_amount', 'settled_amount', 'sellers', 'seller_id', 'search', 'date_type', 'from', 'to'));
        // Calculate the sum of cash_amt from the Order table
        // $orderSum = Order::sum('cash_amt');

        // // Calculate the sum of cash_amt from the Receipt table
        // $receiptSum = Receipt::sum('cash_amt');

        // // Calculate the sum of cash_amt from the Expense table
        // $expenseSum = Expenses::sum('amount');

        // // Calculate the sum of cash_amt from the CashDeposit table
        // $cashDepositSum = Cashdeposit::sum('totalAmount');

        // // Calculate the final opening balance
        // $openingBalance = ($orderSum + $receiptSum) - ($expenseSum + $cashDepositSum);
        // // Get transactions from Order, Receipt, Expense, and CashDeposit tables
        // $orderTransactions = Order::select('id', 'cash_amt as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Order" as type'))->addSelect(DB::raw('"credit" as ctype'))->get();
        // $receiptTransactions = Receipt::select('id', 'cash_amt as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Receipt" as type'))->addSelect(DB::raw('"credit" as ctype'))->get();
        // $expenseTransactions = Expenses::select('id', 'amount as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Expenses" as type'))->addSelect(DB::raw('"debit" as ctype'))->get();
        // $cashDepositTransactions = Cashdeposit::select('id', 'totalAmount as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Cash Deposit" as type'))->addSelect(DB::raw('"debit" as ctype'))->get();

        // // Merge all transactions
        // $allTransactions = $orderTransactions->merge($receiptTransactions)->merge($expenseTransactions)->merge($cashDepositTransactions);
            
        // // Sort transactions by transaction date
        // $allTransactions = $allTransactions->sortByDesc('transaction_date');

        // // Calculate closing balance for each transaction
        // $runningBalance = 0;
        
        // $reportRows = [];
        //--------------------------------
        // Calculate opening balance before the start date
        $openingBalance = $this->calculateOpeningBalance($from);

        // Get transactions based on the date filter
        $allTransactions = $this->getFilteredTransactions($date_type, $from, $to);

        // Sort transactions by transaction date
        $allTransactions = $allTransactions->sortBy('transaction_date');

        // Calculate closing balance for each transaction
        $runningBalance = $openingBalance;
        $reportRows = [];

        foreach ($allTransactions as $transaction) {
            $amount = ($transaction->ctype == 'credit') ? $transaction->amount : -$transaction->amount;
            $runningBalance += $amount;

            $reportRows[] = [
                'id' => $transaction->id,
                'transaction_date' => $transaction->transaction_date,
                'amount' => $amount,
                'type' => $transaction->type,
                'running_balance' => $runningBalance,
            ];
        }
        // @dd($reportRows);
        // Return the detailed report as JSON
        return view('admin-views.report.cashbook', [
            'openingBalance' => $openingBalance,
            'closingBalance' => end($reportRows)['running_balance'] ?? $openingBalance,
            'transactions' => $reportRows,
            'date_type' => $date_type,
            'from' => $from,
            'to' => $to,
        ]);
    }

    private function calculateOpeningBalance($from)
    {
        // Implement the opening balance calculation logic here
        // For example, sum of cash_amt from previous transactions before the start date
        // $from = '2023-12-25';
        
        $openingBalance = Order::where('created_at', '<', $from)->sum('cash_amt')
            + Receipt::where('created_at', '<', $from)->sum('cash_amt')
            - Expenses::where('created_at', '<', $from)->sum('amount')
            - Cashdeposit::where('created_at', '<', $from)->sum('totalAmount');
            // @dd($openingBalance);
        // $orderSum = Order::sum('cash_amt');
        // $receiptSum = Receipt::sum('cash_amt');

        // $openingBalances = $orderSum + $receiptSum;
        // // @dd($openingBalances);
        // $expenseSum = Expenses::sum('amount');
        // $cashDepositSum = Cashdeposit::sum('totalAmount');

        // $openingBalancess = $expenseSum + $cashDepositSum;
        // @dd($openingBalancess);
        return $openingBalance;
    }

    public function getFilteredTransactions($date_type, $from, $to)
    {
        // Fetch transactions from different tables
        $orderTransactions = Order::select('id', 'cash_amt as amount', 'created_at as transaction_date')
            ->addSelect(DB::raw('"Order" as type'))
            ->addSelect(DB::raw('"credit" as ctype'))
            ->get();
        
        $receiptTransactions = Receipt::select('id', 'cash_amt as amount', 'created_at as transaction_date')
            ->addSelect(DB::raw('"Receipt" as type'))
            ->addSelect(DB::raw('"credit" as ctype'))
            ->get();

        $expenseTransactions = Expenses::select('id', 'amount as amount', 'created_at as transaction_date')
            ->addSelect(DB::raw('"Expenses" as type'))
            ->addSelect(DB::raw('"debit" as ctype'))
            ->get();
            
        $cashDepositTransactions = Cashdeposit::select('id', 'totalAmount as amount', 'created_at as transaction_date')
            ->addSelect(DB::raw('"Cash Deposit" as type'))
            ->addSelect(DB::raw('"debit" as ctype'))
            ->get();

        // Merge all transactions
        $allTransactions = $orderTransactions->concat($receiptTransactions)->concat($expenseTransactions)->concat($cashDepositTransactions);

        // @dd($allTransactions);
        // Apply date filter conditions
        $filteredTransactions = $this->applyDateFilter($allTransactions, $date_type, $from, $to);
        
        return $filteredTransactions;
    }

    private function applyDateFilter($transactions, $date_type, $from, $to)
{
    // Filter transactions based on date criteria
    switch ($date_type) {
        case 'today':
        
            $filteredTransactions = $transactions->whereDate('transaction_date', Carbon::now()->toDateString());
            // @dd(filteredTransactions);
            break;
           

        case 'this_month':
            $filteredTransactions = $transactions->whereMonth('transaction_date', now()->month);
            break;

        case 'this_week':
            $filteredTransactions = $transactions->whereBetween('transaction_date', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
            break;

        case 'custom_date':
            // Include transactions on the end date as well
            $filteredTransactions = $transactions->whereBetween('transaction_date', [$from, date('Y-m-d', strtotime($to . ' + 1 day'))]);
            break;

        default:
            $filteredTransactions = $transactions;
            break;
    }

    return $filteredTransactions;
}

    public function cashbook_original(Request $request)
    {
        // $seller_id = $request->seller_id ?? 'all';
        $date_type = $request->date_type ?? 'this_year';
        $from = $request->from;
        $to = $request->to;
        $search = $request->search;
        $query_param = ['search' => $request->search, 'date_type' => $date_type, 'from' => $from, 'to' => $to];

        // $date_type = $request->input('date_type', 'today');
        // $from = $request->input('from');
        // $to = $request->input('to');
        // $sellers = Seller::where(['status'=>'approved'])->get();

        // $chart_data = self::order_report_chart_filter($request);

        // $orders = self::all_order_table_data_filter($request);
        // $orders = $orders->latest('updated_at')->paginate(Helpers::pagination_limit())->appends($query_param);

        // $ongoing_order_query = Order::whereIn('order_status',['out_for_delivery','processing','confirmed', 'pending']);
        // $ongoing_order = self::order_count($request, $ongoing_order_query);

        // $cancel_order_query = Order::whereIn('order_status',['canceled','failed','returned']);
        // $canceled_order = self::order_count($request, $cancel_order_query);

        // $delivered_order_query = Order::where('order_status','delivered');
        // $delivered_order = self::order_count($request, $delivered_order_query);

        // $order_count = array(
        //     'ongoing_order'=>$ongoing_order,
        //     'canceled_order'=>$canceled_order,
        //     'delivered_order'=>$delivered_order,
        //     'total_order'=>$canceled_order+$ongoing_order+$delivered_order,
        // );

        // $due_amount_order_query = Order::whereNotIn('order_status', ['delivered', 'canceled', 'returned', 'failed'])
        //     ->when($seller_id != 'all', function ($query) use ($seller_id) {
        //         $query->when($seller_id == 'inhouse', function ($q) {
        //             $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
        //         })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
        //             $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
        //         });
        //     });
        // $due_amount = self::date_wise_common_filter($due_amount_order_query, $date_type, $from, $to)->sum('order_amount');

        // $settled_amount_query = Order::where('order_status','delivered')
        //     ->when($seller_id != 'all', function ($query) use ($seller_id) {
        //         $query->when($seller_id == 'inhouse', function ($q) {
        //             $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
        //         })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
        //             $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
        //         });
        //     });
        // $settled_amount = self::date_wise_common_filter($settled_amount_query, $date_type, $from, $to)->sum('order_amount');

        // $digital_payment_query = Order::where(['order_status' => 'delivered'])->whereNotIn('payment_method', ['cash', 'cash_on_delivery', 'pay_by_wallet', 'offline_payment']);
        // $digital_payment = self::pie_chart_common_query($request, $digital_payment_query)->sum('order_amount');

        // $cash_payment_query = Order::where(['order_status' => 'delivered'])->whereIn('payment_method', ['cash', 'cash_on_delivery']);
        // $cash_payment = self::pie_chart_common_query($request, $cash_payment_query)->sum('order_amount');

        // $wallet_payment_query = Order::where(['order_status' => 'delivered'])->where(['payment_method' => 'pay_by_wallet']);
        // $wallet_payment = self::pie_chart_common_query($request, $wallet_payment_query)->sum('order_amount');

        // $offline_payment_query = Order::where(['payment_method' => 'offline_payment']);
        // $offline_payment = self::pie_chart_common_query($request, $offline_payment_query)->sum('order_amount');

        // $total_payment = $cash_payment + $wallet_payment + $digital_payment + $offline_payment;

        // $payment_data = [
        //     'total_payment' => $total_payment,
        //     'cash_payment' => $cash_payment,
        //     'wallet_payment' => $wallet_payment,
        //     'offline_payment' => $offline_payment,
        //     'digital_payment' => $digital_payment,
        // ];

        // return view('admin-views.report.cashbook', compact('orders', 'order_count', 'payment_data', 'chart_data', 'due_amount', 'settled_amount', 'sellers', 'seller_id', 'search', 'date_type', 'from', 'to'));
        // Calculate the sum of cash_amt from the Order table
        $orderSum = Order::sum('cash_amt');

        // Calculate the sum of cash_amt from the Receipt table
        $receiptSum = Receipt::sum('cash_amt');

        // Calculate the sum of cash_amt from the Expense table
        $expenseSum = Expenses::sum('amount');

        // Calculate the sum of cash_amt from the CashDeposit table
        $cashDepositSum = Cashdeposit::sum('totalAmount');

        // Calculate the final opening balance
        $openingBalance = ($orderSum + $receiptSum) - ($expenseSum + $cashDepositSum);
        // Get transactions from Order, Receipt, Expense, and CashDeposit tables
        $orderTransactions = Order::select('id', 'cash_amt as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Order" as type'))->addSelect(DB::raw('"credit" as ctype'))->get();
        $receiptTransactions = Receipt::select('id', 'cash_amt as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Receipt" as type'))->addSelect(DB::raw('"credit" as ctype'))->get();
        $expenseTransactions = Expenses::select('id', 'amount as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Expenses" as type'))->addSelect(DB::raw('"debit" as ctype'))->get();
        $cashDepositTransactions = Cashdeposit::select('id', 'totalAmount as amount', 'created_at as transaction_date')->addSelect(DB::raw('"Cash Deposit" as type'))->addSelect(DB::raw('"debit" as ctype'))->get();

        // Merge all transactions
        $allTransactions = $orderTransactions->merge($receiptTransactions)->merge($expenseTransactions)->merge($cashDepositTransactions);
            
        // Sort transactions by transaction date
        $allTransactions = $allTransactions->sortByDesc('transaction_date');

        // Calculate closing balance for each transaction
        $runningBalance = 0;
        
        $reportRows = [];

        foreach ($allTransactions as $transaction) {
            $amount = ($transaction->ctype == 'credit') ? $transaction->amount : -$transaction->amount;
            $runningBalance += $amount;

            $reportRows[] = [
                'id' => $transaction->id,
                'transaction_date' => $transaction->transaction_date,
                'type' => $transaction->type,
                'amount' => $transaction->amount,
                'running_balance' => $runningBalance,
            ];
        }
        // @dd($reportRows);
        // Return the detailed report as JSON
        return view('admin-views.report.cashbook', [
            'openingBalance' => $openingBalance,
            'closingBalance' => end($reportRows)['running_balance'] ?? $openingBalance,
            'transactions' => $reportRows,
        ]);
    }

    public function order_report_chart_filter($request)
    {
        $from = $request['from'];
        $to = $request['to'];
        $date_type = $request['date_type'] ?? 'this_year';

        if ($date_type == 'this_year') { //this year table
            $number = 12;
            $default_inc = 1;
            $current_start_year = date('Y-01-01');
            $current_end_year = date('Y-12-31');
            $from_year = Carbon::parse($from)->format('Y');

            $this_year = self::order_report_same_year($request, $current_start_year, $current_end_year, $from_year, $number, $default_inc);
            return $this_year;

        } elseif ($date_type == 'this_month') { //this month table
            $current_month_start = date('Y-m-01');
            $current_month_end = date('Y-m-t');
            $inc = 1;
            $month = date('m');
            $number = date('d', strtotime($current_month_end));

            $this_month = self::order_report_same_month($request, $current_month_start, $current_month_end, $month, $number, $inc);
            return $this_month;

        } elseif ($date_type == 'this_week') {
            $this_week = self::order_report_this_week($request);
            return $this_week;

        } elseif ($date_type == 'custom_date' && !empty($from) && !empty($to)) {
            $start_date = Carbon::parse($from)->format('Y-m-d 00:00:00');
            $end_date = Carbon::parse($to)->format('Y-m-d 23:59:59');
            $from_year = Carbon::parse($from)->format('Y');
            $from_month = Carbon::parse($from)->format('m');
            $from_day = Carbon::parse($from)->format('d');
            $to_year = Carbon::parse($to)->format('Y');
            $to_month = Carbon::parse($to)->format('m');
            $to_day = Carbon::parse($to)->format('d');

            if ($from_year != $to_year) {
                $different_year = self::order_report_different_year($request, $start_date, $end_date, $from_year, $to_year);
                return $different_year;

            } elseif ($from_month != $to_month) {
                $same_year = self::order_report_same_year($request, $start_date, $end_date, $from_year, $to_month, $from_month);
                return $same_year;

            } elseif ($from_month == $to_month) {
                $same_month = self::order_report_same_month($request, $start_date, $end_date, $from_month, $to_day, $from_day);
                return $same_month;
            }

        }
    }

    public function order_report_same_year($request, $start_date, $end_date, $from_year, $number, $default_inc)
    {
        $orders = self::order_report_chart_common_query($request, $start_date, $end_date)
            ->selectRaw('sum(order_amount) as order_amount, YEAR(updated_at) year, MONTH(updated_at) month')
            ->groupBy(DB::raw("DATE_FORMAT(updated_at, '%M')"))
            ->latest('updated_at')->get();

        for ($inc = $default_inc; $inc <= $number; $inc++) {
            $month = date("F", strtotime("2023-$inc-01"));
            $order_amount[$month . '-' . $from_year] = 0;
            foreach ($orders as $match) {
                if ($match['month'] == $inc) {
                    $order_amount[$month . '-' . $from_year] = $match['order_amount'];
                }
            }
        }

        return array(
            'order_amount' => $order_amount,
        );
    }

    public function order_report_same_month($request, $start_date, $end_date, $month_date, $number, $default_inc)
    {
        $year_month = date('Y-m', strtotime($start_date));
        $month = date("F", strtotime("$year_month"));

        $orders = self::order_report_chart_common_query($request, $start_date, $end_date)
            ->selectRaw('sum(order_amount) as order_amount, YEAR(updated_at) year, MONTH(updated_at) month, DAY(updated_at) day')
            ->groupBy(DB::raw("DATE_FORMAT(updated_at, '%D')"))
            ->latest('updated_at')->get();

        for ($inc = $default_inc; $inc <= $number; $inc++) {
            $day = date('jS', strtotime("$year_month-$inc"));
            $order_amount[$day . '-' . $month] = 0;
            foreach ($orders as $match) {
                if ($match['day'] == $inc) {
                    $order_amount[$day . '-' . $month] = $match['order_amount'];
                }
            }
        }

        return array(
            'order_amount' => $order_amount,
        );
    }

    public function order_report_this_week($request)
    {
        $start_date = Carbon::now()->startOfWeek();
        $end_date = Carbon::now()->endOfWeek();

        $number = 6;
        $period = CarbonPeriod::create(Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek());
        $day_name = array();
        foreach ($period as $date) {
            array_push($day_name, $date->format('l'));
        }

        $orders = self::order_report_chart_common_query($request, $start_date, $end_date)
            ->select(
                DB::raw('sum(order_amount) as order_amount'),
                DB::raw("(DATE_FORMAT(updated_at, '%W')) as day")
            )
            ->groupBy(DB::raw("DATE_FORMAT(updated_at, '%D')"))
            ->latest('updated_at')->get();

        for ($inc = 0; $inc <= $number; $inc++) {
            $order_amount[$day_name[$inc]] = 0;
            foreach ($orders as $match) {
                if ($match['day'] == $day_name[$inc]) {
                    $order_amount[$day_name[$inc]] = $match['order_amount'];
                }
            }
        }

        return array(
            'order_amount' => $order_amount,
        );
    }

    public function order_report_different_year($request, $start_date, $end_date, $from_year, $to_year)
    {
        $orders = self::order_report_chart_common_query($request, $start_date, $end_date)
            ->selectRaw('sum(order_amount) as order_amount, YEAR(updated_at) year')
            ->groupBy(DB::raw("DATE_FORMAT(updated_at, '%Y')"))
            ->latest('updated_at')->get();

        for ($inc = $from_year; $inc <= $to_year; $inc++) {
            $order_amount[$inc] = 0;
            foreach ($orders as $match) {
                if ($match['year'] == $inc) {
                    $order_amount[$inc] = $match['order_amount'];
                }
            }
        }

        return array(
            'order_amount' => $order_amount,
        );
    }

    public function order_report_chart_common_query($request, $start_date, $end_date)
    {
        $seller_id = $request['seller_id'] ?? 'all';

        $query = Order::where([ 'order_status'=>'delivered'])
            ->when($seller_id != 'all', function ($query) use ($seller_id) {
                $query->when($seller_id == 'inhouse', function ($q) {
                    $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
                })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                    $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
                });
            })
            ->whereDate('updated_at', '>=', $start_date)
            ->whereDate('updated_at', '<=', $end_date);

        return $query;
    }

    public function pie_chart_common_query($request, $query)
    {
        $from = $request['from'];
        $to = $request['to'];
        $seller_id = $request['seller_id'] ?? 'all';
        $date_type = $request['date_type'] ?? 'this_year';

        $query_f = $query->when($seller_id != 'all', function ($query) use ($seller_id) {
                $query->when($seller_id == 'inhouse', function ($q) {
                    $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
                })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                    $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
                });
            });

        return self::date_wise_common_filter($query_f, $date_type, $from, $to);;
    }

    public function order_report_export_excel(Request $request){
        $orders = self::all_order_table_data_filter($request)->latest('updated_at')->get();

        $data = array();
        foreach ($orders as $order) {
            $data[] = array(
                'Order ID' => $order->id,
                'Total Amount' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->order_amount)),
                'Product Discount' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->details_sum_discount)),
                'Coupon Discount' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->discount_amount)),
                'Shipping Charge' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->shipping_cost)),
                'VAT/TAX' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->details_sum_tax)),
                'Commission' => BackEndHelper::set_symbol(BackEndHelper::usd_to_currency($order->admin_commission)),
                'Status' => BackEndHelper::order_status($order->order_status)
            );
        }

        return (new FastExcel($data))->download('order_report_list.xlsx');
    }

    public function all_order_table_data_filter($request)
    {
        $search = $request['search'];
        $from = $request['from'];
        $to = $request['to'];
        $seller_id = $request['seller_id'] ?? 'all';
        $date_type = $request['date_type'] ?? 'this_year';

        $orders_query = Order::withSum('details', 'tax')
            ->withSum('details', 'discount')
            ->when($search, function ($q) use ($search) {
                $q->orWhere('id', 'like', "%{$search}%");
            })
            ->when($seller_id != 'all', function ($query) use ($seller_id) {
                $query->when($seller_id == 'inhouse', function ($q) {
                    $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
                })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                    $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
                });
            });
        $orders = self::date_wise_common_filter($orders_query, $date_type, $from, $to);

        return $orders;
    }

    public function order_count($request, $query){
        $from = $request['from'];
        $to = $request['to'];
        $seller_id = $request['seller_id'] ?? 'all';
        $date_type = $request['date_type'] ?? 'this_year';

        $query_f = $query->when($seller_id != 'all', function ($query) use ($seller_id) {
            $query->when($seller_id == 'inhouse', function ($q) {
                $q->where(['seller_id' => 1, 'seller_is' => 'admin']);
            })->when($seller_id != 'inhouse', function ($q) use ($seller_id) {
                $q->where(['seller_id' => $seller_id, 'seller_is' => 'seller']);
            });
        });

        $count = self::date_wise_common_filter($query_f, $date_type, $from, $to)->count();
        return $count;
    }

    public function date_wise_common_filter($query, $date_type, $from, $to)
    {
        return $query->when(($date_type == 'this_year'), function ($query) {
            return $query->whereYear('updated_at', date('Y'));
        })
            ->when(($date_type == 'this_month'), function ($query) {
                return $query->whereMonth('updated_at', date('m'))
                    ->whereYear('updated_at', date('Y'));
            })
            ->when(($date_type == 'this_week'), function ($query) {
                return $query->whereBetween('updated_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
            })
            ->when(($date_type == 'custom_date' && !is_null($from) && !is_null($to)), function ($query) use ($from, $to) {
                return $query->whereDate('updated_at', '>=', $from)
                    ->whereDate('updated_at', '<=', $to);
            });
    }
}
