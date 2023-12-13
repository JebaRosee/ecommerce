<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Receipt;
use App\Model\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;
use App\Model\Order;

class ReceiptController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = Receipt::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('created_at', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $categories = Receipt::orderBy('created_at', 'desc');
        }

        $categories = $categories->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.receipt.view', compact('categories','search'));
    }

    public function store(Request $request)
    {
        // $request->validate([
        //     'name' => 'required',
        //     'image' => 'required',
        //     'priority'=>'required'
        // ], [
        //     'name.required' => 'Category name is required!',
        //     'image.required' => 'Category image is required!',
        //     'priority.required' => 'Category priority is required!',
        // ]);

        $receipt = new Receipt;
        $receipt->customer_id = $request->customer_id;
        $receipt->receipt_amount = $request->receipt_amount;
        $receipt->cash_amt = $request->cash_amt;
        $receipt->card_num = $request->card_num;
        $receipt->card_code = $request->card_code;
        $receipt->card_amt = $request->card_amt;
        $receipt->upi_amt = $request->upi_amt;
        $receipt->upi_id = $request->upi_id;
        $receipt->credit_amt = $request->credit_amt;
        $receipt->credit_remark = $request->credit_remark;
        $receipt->save();
        
        // @dd($receipt->id);
        session(['last_receipt' => $receipt->id]);
        Toastr::success('Payment added successfully!');
        return back();
    }

    public function edit(Request $request, $id)
    {
        $category = Category::with('translations')->withoutGlobalScopes()->find($id);
        return view('admin-views.category.category-edit', compact('category'));
    }

    public function update(Request $request)
    {
        $category = Category::find($request->id);
        $category->name = $request->name[array_search('en', $request->lang)];
        $category->slug = Str::slug($request->name[array_search('en', $request->lang)]);
        if ($request->image) {
            $category->icon = ImageManager::update('category/', $category->icon, 'png', $request->file('image'));
        }
        $category->priority = $request->priority;
        $category->save();

        foreach ($request->lang as $index => $key) {
            if ($request->name[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Model\Category',
                        'translationable_id' => $category->id,
                        'locale' => $key,
                        'key' => 'name'],
                    ['value' => $request->name[$index]]
                );
            }
        }

        Toastr::success('Category updated successfully!');
        return back();
    }

    public function delete(Request $request)
    {
        $categories = Category::where('parent_id', $request->id)->get();
        if (!empty($categories)) {
            foreach ($categories as $category) {
                $categories1 = Category::where('parent_id', $category->id)->get();
                if (!empty($categories1)) {
                    foreach ($categories1 as $category1) {
                        $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$category1->id);
                        $translation->delete();
                        Category::destroy($category1->id);

                    }
                }
                $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$category->id);
                $translation->delete();
                Category::destroy($category->id);

            }
        }
        $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$request->id);
        $translation->delete();
        Category::destroy($request->id);

        return response()->json();
    }

    public function fetch(Request $request)
    {
        if ($request->ajax()) {
            $data = Category::where('position', 0)->orderBy('id', 'desc')->get();
            return response()->json($data);
        }
    }

    public function status(Request $request)
    {
        $category = Category::find($request->id);
        $category->home_status = $request->home_status;
        $category->save();
        // Toastr::success('Service status updated!');
        // return back();
        return response()->json([
            'success' => 1,
        ], 200);
    }
}
