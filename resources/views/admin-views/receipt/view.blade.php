@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Receipt'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Title -->
        <div class="mb-3">
            <h2 class="h1 mb-0 d-flex gap-10">
                <img src="{{asset('/public/assets/back-end/img/brand-setup.png')}}" alt="">
                {{\App\CPU\translate('Receipt')}} {{\App\CPU\translate('Payment')}}
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
                        <form action="{{route('admin.receipt.store')}}" method="POST" enctype="multipart/form-data">
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
                                    <label class="title-color">{{\App\CPU\translate('Customer_Name')}}<span class="text-danger">*</span></label>
                                        <select required onchange="customer_change(this.value);" id='customer' name="customer_id" data-placeholder="Walk In Customer" class="js-data-example-ajax form-control form-ellipsis">
                                            <option value="0">{{\App\CPU\translate('customer_name')}}</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-3 col-lg-2 form-group">
                                    <label class="title-color">{{\App\CPU\translate('Receipt_amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" name="receipt_amount" id="receipt_amount" class="form-control"placeholder="{{\App\CPU\translate('Ex :')}} {{\App\CPU\translate('1000')}}" {{$lang == $default_lang? 'required':''}} required readonly>

                                </div>
                                
                            </div>

    <!-- ----------------------Paid by--------------------- -->
    <div class="row">
       
    <div class="col-lg-4">
            <div class="title-color d-flex mb-2">{{\App\CPU\translate('Paid By')}}:</div>
                    <ul class="list-unstyled option-buttons">
                <li>
                    <input type="radio" id="cash" value="cash" name="type" hidden checked>
                    <label for="cash" class="btn btn--bordered btn--bordered-black px-4 mb-0">{{\App\CPU\translate('cash')}}</label>
                </li>
                <li>
                    <input type="radio" value="card" id="card" name="type" hidden>
                    <label for="card" class="btn btn--bordered btn--bordered-black px-4 mb-0">{{\App\CPU\translate('Card')}}</label>
                </li>
                <li>
                    <input type="radio" value="upi" id="upi" name="type" hidden>
                    <label for="upi" class="btn btn--bordered btn--bordered-black px-4 mb-0">{{\App\CPU\translate('Upi')}}</label>
                </li>
                {{-- <li>
                    <input type="radio" value="credit" id="credit" name="type" hidden>
                    <label for="credit" class="btn btn--bordered btn--bordered-black px-4 mb-0">{{\App\CPU\translate('Credit')}}</label>
                </li> --}}
            </ul>
        </div>

        <div class="col-lg-4">
            <div class="from-group" id="cashInput" style="">
                <label class="title-color">{{\App\CPU\translate('CASH')}}</label>
                <input type="text" id="cash_amt" class="form-control" name="cash_amt" placeholder="Ex: 500" oninput="validateNumericInput(this)" required>
            </div>

            <div class="from-group" id="cardInput" style="display: none;">
                <label class="title-color">{{\App\CPU\translate('Card Number')}}</label>
                <input type="text" id="card_num" class="form-control" name="card_num" placeholder="Ex: 0000" maxlength="4">
                <label class="title-color">{{\App\CPU\translate('APPR Code')}}</label>
                <input type="text" id="card_code" class="form-control" name="card_code" placeholder="Ex: 000000" maxlength="6">
                <label class="title-color">{{\App\CPU\translate('Amount')}}</label>
                <input type="text" id="card_amt" class="form-control" name="card_amt" placeholder="Ex: 500" oninput="validateNumericInput(this)">
            </div>
            <div class="from-group" id="upiInput" style="display: none;">
                <label class="title-color">{{\App\CPU\translate('Amount')}}</label>
                <input type="text" id="upi_amt" class="form-control" name="upi_amt" placeholder="Ex: 500" oninput="validateNumericInput(this)">
                <label class="title-color">{{\App\CPU\translate('Upi ID')}}</label>
                <input type="text" id="upi_id" class="form-control" name="upi_id" placeholder="Ex: www@axl">
            </div>
            <div class="from-group" id="creditInput" style="display: none;">
                <label class="title-color">{{\App\CPU\translate('Amount')}}</label>
                <input type="text" id="credit_amt" class="form-control" name="credit_amt" placeholder="Ex: 500">
                <label class="title-color">{{\App\CPU\translate('Remark')}}</label>
                <input type="text" id="credit_remark" class="form-control" name="credit_remark" placeholder="Ex: Type here">
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
            </div>
        </div>

        <div class="row mt-20" id="cate-table">
            <div class="col-md-12">
                <div class="card">

                    <div class="table-responsive">
                        <table style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                            class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table w-100">
                            <thead class="thead-light thead-50 text-capitalize">
                                <tr>
                                    <th>{{ \App\CPU\translate('ID')}}</th>
                                    <th class="text-center">{{ \App\CPU\translate('Receipt Date')}}</th>
                                    <th class="text-center">{{ \App\CPU\translate('Customer')}}</th>
                                    <th class="text-right">{{\App\CPU\translate('Amt Paid')}}</th>
                                    <th class="text-right">{{\App\CPU\translate('Payment type')}}</th>
                                    <th class="text-right">{{\App\CPU\translate('Action')}}</th>
                                    {{-- <th class="text-center">{{ \App\CPU\translate('Balance')}}</th> --}}
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($categories as $key=>$category)
                                <tr>
                                    <td >{{$category['id']}}</td>
                                    {{-- <td class="text-center">
                                        <img class="rounded" width="64"
                                                onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                src="{{asset('storage/app/public/category')}}/{{$category['icon']}}">
                                    </td> --}}
                                    <td class="text-center">{{ $category['created_at']->format('d-m-Y') }}</td>
                                    <td class="text-center">{{$category->customer['f_name'].' '.$category->customer['l_name']}}</td>
                                    <td class="text-right">{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($category['cash_amt'] + $category['card_amt'] + $category['upi_amt']))}}</td>

                                    <td class="text-right">
                                        @php ($displayAmounts = array_filter([
                                                $category['cash_amt'] > 0 ? 'Cash: ' . \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($category['cash_amt'])) : null,
                                                $category['card_amt'] > 0 ? 'Card: ' . \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($category['card_amt'])) : null,
                                                $category['upi_amt'] > 0 ? 'Upi: ' . \App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($category['upi_amt'])) : null,
                                            ]))
                                    
                                            {{ implode(', ', $displayAmounts) }} 
                                        
                                    </td>
                                    
                                    
                                    {{-- <td class="text-center">
                                        <label class="switcher mx-auto">
                                            <input type="checkbox" class="switcher_input category-status"
                                                    id="{{$category['id']}}" {{$category->home_status == 1?'checked':''}}>
                                            <span class="switcher_control"></span>
                                        </label>
                                    </td> --}}
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
                                    {{-- <td>
                                        <div class="d-flex justify-content-center gap-10">
                                        <a id="printBtn" class="btn btn-outline-info btn-sm square-btn" title="{{ \App\CPU\translate('print')}}" data-receipt-id="{{ $category->id }}">
                                            <i class="tio-print"></i>
                                        </a>
                                        </div>
                                    </td> --}}
                                    <td>
                                        <div class="d-flex justify-content-center gap-10">
                                            <a id="printBtn" class="btn btn-outline-info btn-sm square-btn printBtn" title="{{ \App\CPU\translate('print')}}" data-receipt-id="{{ $category->id }}">
                                                <i class="tio-print"></i>
                                            </a>
                                        </div>
                                    </td>
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
    @php($order=\App\Model\Receipt::find(session('last_receipt')))
    @if($order)
    @php(session(['last_receipt'=> false]))
    <div class="modal fade py-5" id="print-invoice" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 850px !important;">
                <div class="modal-header">
                    <h5 class="modal-title">{{\App\CPU\translate('Print Invoice')}}</h5>
                    <button id="invoice_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body row">
                    <div class="col-md-12">
                        <center>
                            <input id="print_invoice" type="button" class="btn btn--primary non-printable" onclick="printDiv('printableArea')"
                                value="{{\App\CPU\translate('proceed')}}, {{\App\CPU\translate('if_printer_is_ready')}}"/>
                            <a href="{{url()->previous()}}" class="btn btn-danger non-printable">{{\App\CPU\translate('Back')}}</a>
                        </center>
                        <hr class="non-printable">
                    </div>
                    <div class="row m-auto" id="printableArea">
                        @include('admin-views.receipt.invoice')
                    </div>

                </div>
            </div>
        </div>
    </div>
    @endif
    {{-- @php(print_r(session('selectedReceiptId'))) --}}
    {{-- <input type="text" id="selectedReceiptIdInput" name="selectedReceiptId" value="1"> --}}
    {{-- @php($selectedReceiptId = \Illuminate\Support\Facades\Session::get('selectedReceiptId'))
    @php($order = \App\Model\Receipt::find($selectedReceiptId)) --}}
    {{-- @php($selectedReceiptId = request('selectedReceiptId')) --}}
    @php($orders=\App\Model\Receipt::find(session('selectedReceiptId')))
    @if($orders)
  
    <div class="modal fade py-5" id="print-invoices" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 850px !important;">
                <div class="modal-header">
                    <h5 class="modal-title">{{\App\CPU\translate('Print Invoice')}}</h5>
                    <button id="invoice_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body row">
                    <div class="col-md-12">
                        <center>
                         
                            <input id="print_invoice" type="button" class="btn btn--primary non-printable" onclick="printDiv('printableArea')"
                                value="{{\App\CPU\translate('proceed')}}, {{\App\CPU\translate('if_thermal_printer_is_ready')}}"/>
                            <a href="{{url()->previous()}}" class="btn btn-danger non-printable">{{\App\CPU\translate('Back')}}</a>
                        </center>
                        <hr class="non-printable">
                    </div>
                    <div class="row m-auto" id="printableArea">
                        @php($order=\App\Model\Receipt::find(session('selectedReceiptId')))
                        @php(session(['selectedReceiptId'=> false]))
                         @include('admin-views.receipt.invoice') 
                    </div>

                </div>
            </div>
        </div>
    </div>
    @endif
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
            url: '{{route('admin.pos.customers-withoutwalkin')}}',
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
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{\App\CPU\translate('Are_you_sure')}}?',
                text: "{{\App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                showCancelButton: true,
                type: 'warning',
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{\App\CPU\translate('Yes')}}, {{\App\CPU\translate('delete_it')}}!',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.category.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('{{\App\CPU\translate('Category_deleted_Successfully.')}}');
                            location.reload();
                        }
                    });
                }
            })
        });


        $(document).on('click', '.printBtn', function () {
            var receiptId = $(this).attr("data-receipt-id");
            //  alert(receiptId)
            //var receiptId = this.getAttribute('data-receipt-id');
            //var al = localStorage.setItem('selectedReceiptId', receiptId);
           // alert(al);
        //    $('#selectedReceiptIdInput').val(receiptId);
           $.ajax({
                url: "{{route('admin.receipt.receiptid')}}",
                method: 'POST',
                data: {
                    _token: '{{csrf_token()}}',
                    receiptId: receiptId,
                   
                },
                success: function(response) {
                     location.reload();
                    // console.log('ReceiptId stored successfully in session.');
                    //  $('#print-invoices').modal('show');
                    
                },
                error: function(error) {
            console.error('Error storing receiptId in session:', error);
        }
            });

            // $('#print-invoices').modal('show');
            // $('#print-invoices').modal('show');
        });
    </script>

<script>
    "use strict";
    function customer_change(val) {
        //let  cart_id = $('#cart_id').val();
        // alert(val);
        $.post({
                url: '{{route('admin.pos.get-recamt')}}',
                data: {
                    _token: '{{csrf_token()}}',
                    //cart_id:cart_id,
                    user_id:val
                },
                beforeSend: function () {
                    $('#loading').removeClass('d-none');
                },
                success: function (data) {
                    // console.log(data);

                    // var output = '';
                    // for(var i=0; i<data.cart_nam.length; i++) {
                    //     output += `<option value="${data.cart_nam[i]}" ${data.current_user==data.cart_nam[i]?'selected':''}>${data.cart_nam[i]}</option>`;
                    // }
                    // $('#cart_id').html(output);
                    // $('#current_customer').text(data.current_customer);
                    // $('#cart').empty().html(data.view);
                    $('#receipt_amount').val(data.remainingAmount);
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
function validateNumericInput(input) {
  // Remove non-numeric characters from the input value
  input.value = input.value.replace(/[^0-9]/g, '');
}
$(document).on('ready', function () {
        @if($order)
        $('#print-invoice').modal('show');
        @endif

        @if($orders)
        $('#print-invoices').modal('show');
        @endif
    });
    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
        // location.reload();
    }
    
    </script>
    {{-- <script>
        // document.getElementById('printBtn').addEventListener('click', function() {
        //     // var receiptId = this.getAttribute('data-receipt-id');
        //     // printDiv('printableArea', receiptId);
        //     $('#print-invoices').modal('show');
        // });

        document.querySelectorAll('.printBtn').forEach(function(button) {
    button.addEventListener('click', function() {
        var receiptId = this.getAttribute('data-receipt-id');
        localStorage.setItem('selectedReceiptId', receiptId);
        printDivs('printableArea', receiptId);
    });
});
function printDivs(divId, receiptId) {
    // Log the receiptId to ensure it's received correctly
    console.log('Receipt ID:', receiptId);

    var printContents = document.getElementById(divId).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}
    
        // function printDiv(divId, receiptId) {
        //     // Pass the receiptId to your print function
        //     console.log('Receipt ID:', receiptId);
    
        //     var printContents = document.getElementById(divId).innerHTML;
        //     var originalContents = document.body.innerHTML;
    
        //     document.body.innerHTML = printContents;
        //     window.print();
        //     document.body.innerHTML = originalContents;
        // }
    </script> --}}
@endpush
