<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Receipt;
use App\Model\Expenses;
use App\Model\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;

class ExpensesController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = Expenses::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('acc_name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $categories = Expenses::orderBy('created_at', 'desc');
        }

        $categories = $categories->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.expenses.view', compact('categories','search'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'acc_code' => 'required',
            'acc_name' => 'required',
            'amount'=>'required'
        ], [
            'acc_code.required' => 'Code is required!',
            'acc_name.required' => 'Name is required!',
            'amount.required' => 'Amount is required!',
        ]);

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
        $expenses = new Expenses;
        // @dd($cashdeposit);
        $expenses->acc_code = $request->acc_code;
        $expenses->acc_name = $request->acc_name;
        $expenses->remarks = $request->remarks;
        $expenses->amount = $request->amount;
        // $expenses->result2 = $request->result2;
        $expenses->save();
        // Expenses::create($request->all());
        Toastr::success('Added successfully!');
        return back();
    }

    public function edit(Request $request, $id)
    {
        $category = Expenses::find($id);
        return view('admin-views.expenses.expenses-edit', compact('category'));
    }

    public function update(Request $request)
    {
        $expenses = Expenses::find($request->id);
        // $category->name = $request->name[array_search('en', $request->lang)];
        // $category->slug = Str::slug($request->name[array_search('en', $request->lang)]);
        // if ($request->image) {
        //     $category->icon = ImageManager::update('category/', $category->icon, 'png', $request->file('image'));
        // }
        $expenses->acc_code = $request->acc_code;
        $expenses->acc_name = $request->acc_name;
        $expenses->remarks = $request->remarks;
        $expenses->amount = $request->amount;
        // $expenses->result2 = $request->result2;
        $expenses->save();

        // foreach ($request->lang as $index => $key) {
        //     if ($request->name[$index] && $key != 'en') {
        //         Translation::updateOrInsert(
        //             ['translationable_type' => 'App\Model\Category',
        //                 'translationable_id' => $category->id,
        //                 'locale' => $key,
        //                 'key' => 'name'],
        //             ['value' => $request->name[$index]]
        //         );
        //     }
        // }

        Toastr::success('Updated successfully!');
        return back();
    }

    public function delete(Request $request)
    {
        // $categories = Category::where('parent_id', $request->id)->get();
        // if (!empty($categories)) {
        //     foreach ($categories as $category) {
        //         $categories1 = Category::where('parent_id', $category->id)->get();
        //         if (!empty($categories1)) {
        //             foreach ($categories1 as $category1) {
        //                 $translation = Translation::where('translationable_type','App\Model\Category')
        //                             ->where('translationable_id',$category1->id);
        //                 $translation->delete();
        //                 Category::destroy($category1->id);

        //             }
        //         }
        //         $translation = Translation::where('translationable_type','App\Model\Category')
        //                             ->where('translationable_id',$category->id);
        //         $translation->delete();
        //         Category::destroy($category->id);

        //     }
        // }
        // $translation = Translation::where('translationable_type','App\Model\Category')
        //                             ->where('translationable_id',$request->id);
        // $translation->delete();
        Expenses::destroy($request->id);

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
