<?php

namespace App\Http\Controllers\Admin;
use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;
use App\Model\Carddeposit;
use App\CPU\OrderManager;
use App\Model\Order;
use App\Model\OrderDetail;
use App\Model\OrderTransaction;

class CarddepositController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = Category::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $categories = Order::where('card_amt', '>', 0)
            ->whereNotNull('card_amt')
            ->where(function ($query) {
                $query->where('card_deposit', 0)
                      ->orWhereNull('card_deposit');
            });
        }

        $categories = $categories->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.deposit.card.view', compact('categories','search'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'bank_name' => 'required',
            'totalAmount' => 'required'
        ], [
            'bank_name.required' => 'Bank name is required!',
            'totalAmount.required' => 'Amount is required!',
        ]);
        // $request->validate([
        //     'name' => 'required',
        //     'image' => 'required',
        //     'priority'=>'required'
        // ], [
        //     'name.required' => 'Category name is required!',
        //     'image.required' => 'Category image is required!',
        //     'priority.required' => 'Category priority is required!',
        // ]);

        // $category = new Category;
        // $category->name = $request->name[array_search('en', $request->lang)];
        // $category->slug = Str::slug($request->name[array_search('en', $request->lang)]);
        // $category->icon = ImageManager::upload('category/', 'png', $request->file('image'));
        // $category->parent_id = 0;
        // $category->position = 0;
        // $category->priority = $request->priority;
        // $category->save();

        // $data = [];
        // foreach ($request->lang as $index => $key) {
        //     if ($request->name[$index] && $key != 'en') {
        //         array_push($data, array(
        //             'translationable_type' => 'App\Model\Category',
        //             'translationable_id' => $category->id,
        //             'locale' => $key,
        //             'key' => 'name',
        //             'value' => $request->name[$index],
        //         ));
        //     }
        // }
        // if (count($data)) {
        //     Translation::insert($data);
        // }

        $orderIds = $request->input('order_ids');
        $bankId = $request->input('bank_name');
        $totalAmount = $request->input('totalAmount');
            //  @dd($request);
        Order::whereIn('id', $orderIds)->update(['card_deposit' => 1]);

        // Save card deposit information
        $category = new Carddeposit;
        $category->bank_name = $request->bank_name;
        $category->totalAmount = $request->totalAmount;
        $category->save();
        // Carddeposit::create([
        //     'bank_name' => $bankId,
        //     'totalAmount' => $totalAmount,
        // ]);

        Toastr::success('Card deposit updated successfully!');
        // return redirect()->back()->with('success', 'Orders and card deposit updated successfully');
        // return response()->json(['message' => 'Orders and card deposit updated successfully'], 200);
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
