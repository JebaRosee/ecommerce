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
use App\Model\Cashdeposit;

class CashdepositController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];

        if ($request->has('search')) {
            $key = explode(' ', $request['search']);
            $categories = Cashdeposit::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('bank_name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        } else {
            $categories = Cashdeposit::orderBy('created_at', 'desc');
        }

        // Execute the query and paginate the results
        $categories = $categories->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.deposit.view', compact('categories','search'));
    }

    public function store(Request $request)
    {
        
        // $request->validate([
        //     'bank_name' => 'required',
        //     'totalAmount' => 'required'
        // ], [
        //     'bank_name.required' => 'Bank name is required!',
        //     'totalAmount.required' => 'Amount is required!',
        // ]);
        // @dd($request);
        
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
        $cashdeposit = new Cashdeposit;
        // @dd($cashdeposit);
        $cashdeposit->bank_name = $request->bank_name;
        $cashdeposit->amount1 = $request->amount1;
        $cashdeposit->result1 = $request->result1;
        $cashdeposit->amount2 = $request->amount2;
        $cashdeposit->result2 = $request->result2;
        $cashdeposit->amount5 = $request->amount5;
        $cashdeposit->result5 = $request->result5;
        $cashdeposit->amount10 = $request->amount10;
        $cashdeposit->result10 = $request->result10;
        $cashdeposit->amount20 = $request->amount20;
        $cashdeposit->result20 = $request->result20;
        $cashdeposit->amount50 = $request->amount50;
        $cashdeposit->result50 = $request->result50;

        $cashdeposit->amount100 = $request->amount100;
        $cashdeposit->result100 = $request->result100;
        $cashdeposit->amount200 = $request->amount200;
        $cashdeposit->result200 = $request->result200;
        $cashdeposit->amount500 = $request->amount500;
        $cashdeposit->result500 = $request->result500;
        $cashdeposit->amount2000 = $request->amount2000;
        $cashdeposit->result2000 = $request->result2000;
        $cashdeposit->totalAmount = $request->totalAmount;
        $cashdeposit->remarks = $request->remarks;
        $cashdeposit->save();
        // Cashdeposit::create($request->all());
        Toastr::success('Deposited successfully!');
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
