@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Cash Deposit'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Title -->
        <div class="mb-3">
            <h2 class="h1 mb-0 d-flex gap-10">
                <img src="{{asset('/public/assets/back-end/img/brand-setup.png')}}" alt="">
                {{\App\CPU\translate('Cash')}} {{\App\CPU\translate('Deposit')}}
                <input id="date" type="date" name="date" value="{{ old('date', now()->toDateString()) }}" style="position: absolute; right: 0; padding:2px; margin-right:40px;  border: 1px solid #f9f9fb; border-radius:2px;background-color:#f9f9fb; font-weight:bold;" 
                placeholder="{{ \App\CPU\translate('date') }}" required>
            </h2>
        </div>
        <!-- End Page Title -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        <form action="{{route('admin.cash_deposit.store')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @php($language=\App\Model\BusinessSetting::where('type','pnc_language')->first())
                            @php($language = $language->value ?? null)
                            @php($default_lang = 'en')
                            @php($default_lang = json_decode($language)[0])
                            <ul class="nav nav-tabs w-fit-content mb-4">
                                @foreach(json_decode($language) as $lang)
                                    <!-- <li class="nav-item text-capitalize">
                                        <a class="nav-link lang_link {{$lang == $default_lang? 'active':''}}"
                                           href="#"
                                           id="{{$lang}}-link">{{ucfirst(\App\CPU\Helpers::get_language_name($lang)).'('.strtoupper($lang).')'}}</a>
                                    </li> -->
                                @endforeach
                            </ul>
                            <div class="row">
                           
                                <div class="col-lg-4">
                                    
                                    <div class="form-group">
                                    <label class="title-color">{{\App\CPU\translate('Account_type')}}<span class="text-danger">*</span></label>
                                        <select id='bank_name' name="bank_name" class=" form-control form-ellipsis" required>
                                            <!-- <option value="0">{{\App\CPU\translate('Select')}}</option> -->
                                            <option value="Owner">{{\App\CPU\translate('Owner')}}</option>
                                            <option value="City Union Bank">{{\App\CPU\translate('City Union Bank')}}</option>
                                            <option value="SBI Bank">{{\App\CPU\translate('SBI Bank')}}</option>
                                            <option value="HDFC Bank">{{\App\CPU\translate('HDFC BANK')}}</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-3 col-lg-2 form-group">
                                    <label class="title-color">{{\App\CPU\translate('Total_amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" name="totalAmount" id="totalAmount" class="form-control"placeholder="{{\App\CPU\translate('')}} {{\App\CPU\translate('')}}" {{$lang == $default_lang? 'required':''}} readonly>

                                </div>
                                
                            </div>

    <!-- ----------------------Paid by--------------------- -->
    <div class="row">
        
       
    <div class="col-lg-5">
        <br>
        <div class="title-color d-flex mb-2">{{\App\CPU\translate('Denomination')}}:</div>

        <!-- Denomination 1 -->     
        <div class="from-group" id="cashInput" style="display:flex">
        <label for="cash" class="btn px-4 mb-0" data-multiply="1">{{\App\CPU\translate('1')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount1" class="form-control" name="amount1" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('=')}}</label>
        <input type="text" id="result1" class="form-control col-lg-4" name="result1" placeholder="" readonly>
        </div>

        <!-- Denomination 2 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="2">{{\App\CPU\translate('2')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount2" class="form-control" name="amount2" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result2" class="form-control col-lg-4" name="result2" placeholder="" readonly>
        </div>

        <!-- Denomination 5 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="5">{{\App\CPU\translate('5')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount5" class="form-control" name="amount5" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result5" class="form-control col-lg-4" name="result5" placeholder="" readonly>
        </div>

        <!-- Denomination 10 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="10">{{\App\CPU\translate('10')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount10" class="form-control" name="amount10" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result10" class="form-control col-lg-4" name="result10" placeholder="" readonly>
        </div>

        <!-- Denomination 20 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="20">{{\App\CPU\translate('20')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount20" class="form-control" name="amount20" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result20" class="form-control col-lg-4" name="result20" placeholder="" readonly>
        </div>

        <!-- Denomination 50 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="50">{{\App\CPU\translate('50')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount50" class="form-control" name="amount50" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result50" class="form-control col-lg-4" name="result50" placeholder="" readonly>
        </div>

        <!-- Denomination 100 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="100">{{\App\CPU\translate('100')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount100" class="form-control" name="amount100" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result100" class="form-control col-lg-4" name="result100" placeholder="" readonly>
        </div>

        <!-- Denomination 200 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="200">{{\App\CPU\translate('200')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount200" class="form-control" name="amount200" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result200" class="form-control col-lg-4" name="result200" placeholder="" readonly>
        </div>

        <!-- Denomination 500 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="500">{{\App\CPU\translate('500')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount500" class="form-control" name="amount500" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result500" class="form-control col-lg-4" name="result500" placeholder="" readonly>
        </div>

        <!-- Denomination 2000 -->
        <div class="from-group" id="cashInput" style="display:flex; margin-top: 8px;">
        <label for="cash" class="btn px-4 mb-0" data-multiply="2000">{{\App\CPU\translate('2000')}}</label>
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('X')}}</label>
        <input type="text" id="amount2000" class="form-control" name="amount2000" placeholder="Ex: 2" oninput="validateNumericInput(this)">
        <label for="cash" class="btn px-4 mb-0">{{\App\CPU\translate('= ')}}</label>
        <input type="text" id="result2000" class="form-control col-lg-4" name="result2000" placeholder="" readonly>
        </div>

    </div>
</div> 
<!-- ----------------------END Paid by--------------------- -->

                            <div class="d-flex flex-wrap gap-2 justify-content-end">
                                <button type="reset" id="reset" class="btn btn-secondary">{{\App\CPU\translate('reset')}}</button>
                                <button type="submit" class="btn btn--primary">{{\App\CPU\translate('submit')}}</button>
                            </div>
                        </form>
                    </div>
                </div>
            
            
            <div class="row mt-20" id="cate-table">
            <div class="col-md-12">
                <div class="card">
                    <div class="px-3 py-4">
                        <div class="row align-items-center">
                            <div class="col-sm-4 col-md-6 col-lg-8 mb-2 mb-sm-0">
                                <h5 class="text-capitalize d-flex gap-1">
                                    {{ \App\CPU\translate('Cash Deposit Report')}}
                                    <span class="badge badge-soft-dark radius-50 fz-12">{{ $categories->total() }}</span>
                                </h5>
                            </div>
                            <div class="col-sm-8 col-md-6 col-lg-4">
                                <!-- Search -->
                                <form action="{{ url()->current() }}" method="GET">
                                    <div class="input-group input-group-custom input-group-merge">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="" type="search" name="search" class="form-control"
                                            placeholder="{{ \App\CPU\translate('search_here')}}" value="{{ $search }}" required>
                                        <button type="submit" class="btn btn--primary">{{\App\CPU\translate('search')}}</button>
                                    </div>
                                </form>
                                <!-- End Search -->
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                            class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table w-100">
                            <thead class="thead-light thead-50 text-capitalize">
                                <tr>
                                    <th class="text-center">{{ \App\CPU\translate('ID')}}</th>
                                    <!-- <th class="text-center">{{ \App\CPU\translate('Category')}} {{ \App\CPU\translate('Image')}}</th> -->
                                    <th class="text-center">{{ \App\CPU\translate('date')}}</th>
                                    <th class="text-center">{{\App\CPU\translate('bank')}}</th>
                                    <th class="text-right">{{ \App\CPU\translate('total_amount')}}</th>
                                    <!-- <th class="text-center">{{ \App\CPU\translate('action')}}</th> -->
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($categories as $key=>$category)
                                <tr>
                                    <td class="text-center">{{$category['id']}}</td>
                                    <!-- <td class="text-center">
                                        <img class="rounded" width="64"
                                                onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                src="{{asset('storage/app/public/category')}}/{{$category['icon']}}">
                                    </td> -->
                                    <td class="text-center">{{ $category['created_at']->format('d-m-Y') }}</td>

                                    <td class="text-center">{{$category['bank_name']}}</td>
                                    <td class="text-right">
                                        {{$category['totalAmount']}}
                                    </td>
                                    <!-- <td class="text-center">
                                        <label class="switcher mx-auto">
                                            <input type="checkbox" class="switcher_input category-status"
                                                    id="{{$category['id']}}" {{$category->home_status == 1?'checked':''}}>
                                            <span class="switcher_control"></span>
                                        </label>
                                    </td> -->
                                    <!-- <td>
                                        <div class="d-flex justify-content-center gap-10">
                                            <a class="btn btn-outline-info btn-sm square-btn"
                                                title="{{ \App\CPU\translate('Edit')}}"
                                                href="{{route('admin.category.edit',[$category['id']])}}">
                                                <i class="tio-edit"></i>
                                            </a>
                                            <a class="btn btn-outline-danger btn-sm delete square-btn"
                                                title="{{ \App\CPU\translate('Delete')}}"
                                                id="{{$category['id']}}">
                                                <i class="tio-delete"></i>
                                            </a>
                                        </div>
                                    </td> -->
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>


                    <div class="table-responsive mt-4">
                        <div class="d-flex justify-content-lg-end">
                            <!-- Pagination -->
                            {{$categories->links()}}
                        </div>
                    </div>
                    @if(count($categories)==0)
                        <div class="text-center p-4">
                            <img class="mb-3 w-160" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description">
                            <p class="mb-0">{{\App\CPU\translate('no_data_found')}}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
        </div>
        </div>
@endsection

@push('script')
<script>
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
$(document).on('ready', function () {
        $.ajax({
            url: '{{route('admin.pos.get-cart-ids')}}',
            type: 'GET',

            dataType: 'json', // added data type
            beforeSend: function () {
                $('#loading').removeClass('d-none');
                //console.log("loding");
            },
            success: function (data) {
                //console.log(data.cus);
                var output = '';
                    for(var i=0; i<data.cart_nam.length; i++) {
                        output += `<option value="${data.cart_nam[i]}" ${data.current_user==data.cart_nam[i]?'selected':''}>${data.cart_nam[i]}</option>`;
                    }
                    $('#cart_id').html(output);
                    $('#current_customer').text(data.current_customer);
                    $('#cart').empty().html(data.view);

            },
            complete: function () {
                $('#loading').addClass('d-none');
            },
        });
    });

    $('.js-data-example-ajax').select2({
        ajax: {
            url: '{{route('admin.pos.customers')}}',
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data) {
                return {
                results: data
                };
            },
            __port: function (params, success, failure) {
                var $request = $.ajax(params);

                $request.then(success);
                $request.fail(failure);

                return $request;
            }
        }
    });
    $('#date').attr('min',(new Date()).toISOString().split('T')[0]);
</script>
    <script>
        $(".lang_link").click(function (e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.split("-")[0];
            console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
            if (lang == '{{$default_lang}}') {
                $(".from_part_2").removeClass('d-none');
            } else {
                $(".from_part_2").addClass('d-none');
            }
        });

        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>

    <script>
        $(document).on('change', '.category-status', function () {
            var id = $(this).attr("id");
            if ($(this).prop("checked") == true) {
                var status = 1;
            } else if ($(this).prop("checked") == false) {
                var status = 0;
            }
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.category.status')}}",
                method: 'POST',
                data: {
                    id: id,
                    home_status: status
                },
                success: function (data) {
                    if(data.success == true) {
                        toastr.success('{{\App\CPU\translate('Status updated successfully')}}');
                    }
                }
            });
        });
    </script>


<script>
    "use strict";
    function customer_change(val) {
        //let  cart_id = $('#cart_id').val();
        $.post({
                url: '{{route('admin.pos.remove-discount')}}',
                data: {
                    _token: '{{csrf_token()}}',
                    //cart_id:cart_id,
                    user_id:val
                },
                beforeSend: function () {
                    $('#loading').removeClass('d-none');
                },
                success: function (data) {
                    console.log(data);

                    var output = '';
                    for(var i=0; i<data.cart_nam.length; i++) {
                        output += `<option value="${data.cart_nam[i]}" ${data.current_user==data.cart_nam[i]?'selected':''}>${data.cart_nam[i]}</option>`;
                    }
                    $('#cart_id').html(output);
                    $('#current_customer').text(data.current_customer);
                    $('#cart').empty().html(data.view);
                },
                complete: function () {
                    $('#loading').addClass('d-none');
                }
            });
    }
</script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this);
        });

// ---------------paid by----------------

    $('#type_ext_dis').on('change', function (){
        let type = $('#type_ext_dis').val();
        if(type === 'amount'){
            $('#dis_amount').attr('placeholder', 'Ex: 500');
        }else if(type === 'percent'){
            $('#dis_amount').attr('placeholder', 'Ex: 10%');
        }
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
    $(document).ready(function () {
    $('input[type="radio"]').change(function () {
        if ($(this).val() === "upi") {
            $('#upiInput').show();
        } else {
            $('#upiInput').hide();
        }
        if ($(this).val() === "cash") {
            $('#cashInput').show();
        } else {
            $('#cashInput').hide();
        }
        if ($(this).val() === "card") {
            $('#cardInput').show();
        } else {
            $('#cardInput').hide();
        }if ($(this).val() === "credit") {
            $('#creditInput').show();
        } else {
            $('#creditInput').hide();
        }
    });
});
// ---------------paid by----------------

    </script>
    <script>
  // Add event listeners for input changes
  document.getElementById('amount1').addEventListener('input', () => updateResult(1));
  document.getElementById('amount2').addEventListener('input', () => updateResult(2));
  document.getElementById('amount5').addEventListener('input', () => updateResult(5));
  document.getElementById('amount10').addEventListener('input', () => updateResult(10));
  document.getElementById('amount20').addEventListener('input', () => updateResult(20));
  document.getElementById('amount50').addEventListener('input', () => updateResult(50));
  document.getElementById('amount100').addEventListener('input', () => updateResult(100));
  document.getElementById('amount200').addEventListener('input', () => updateResult(200));
  document.getElementById('amount500').addEventListener('input', () => updateResult(500));
  document.getElementById('amount2000').addEventListener('input', () => updateResult(2000));

  function updateResult(denomination) {
    const factor = parseFloat(document.querySelector(`[data-multiply="${denomination}"]`).getAttribute('data-multiply'));
    const inputValue = parseFloat(document.getElementById(`amount${denomination}`).value) || 0;
    const result = factor * inputValue;
    document.getElementById(`result${denomination}`).value = result.toFixed(2); // Adjust decimal places as needed

    calculateTotal();
  }

  function calculateTotal() {
  const amounts = [
    parseFloat(document.getElementById('result1').value) || 0,
    parseFloat(document.getElementById('result2').value) || 0,
    parseFloat(document.getElementById('result5').value) || 0,
    parseFloat(document.getElementById('result10').value) || 0,
    parseFloat(document.getElementById('result20').value) || 0,
    parseFloat(document.getElementById('result50').value) || 0,
    parseFloat(document.getElementById('result100').value) || 0,
    parseFloat(document.getElementById('result200').value) || 0,
    parseFloat(document.getElementById('result500').value) || 0,
    parseFloat(document.getElementById('result2000').value) || 0,
  ];

  const totalAmount = amounts.reduce((acc, current) => acc + current, 0);
  document.getElementById('totalAmount').value = totalAmount.toFixed(2);
  document.getElementById('totalamount2').value = totalAmount.toFixed(2);
}
function validateNumericInput(input) {
  // Remove non-numeric characters from the input value
  input.value = input.value.replace(/[^0-9]/g, '');
}
</script>
@endpush
