@extends('layouts.panel')

@section('title', 'Register Mobile')

@section('content')

    <style>
        #searchCustomerModal .modal-body {
            word-wrap: break-word;
        }

        /* Ensure the button stays within the table */
        .table tbody .choose-btn {
            white-space: normal;
            word-wrap: break-word;
        }
    </style>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <button type="button" class="btn btn-primary float-right" data-toggle="modal"
                        data-target="#searchCustomerModal">Cari Customers</button>
                    <br>

                    <!-- Modal -->
                    <div class="modal fade" id="searchCustomerModal" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Cari Customer</h5>
                                </div>
                                <div class="modal-body">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Nama Customer"
                                            aria-describedby="basic-addon2" id="customerName">
                                        <div class="input-group-append">
                                            <button type="button" class="input-group-text" id="findCustomer">Cari</button>
                                        </div>
                                    </div>
                                    <br>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class='align-middle' style="width: 10%" scope="col">No</th>
                                                <th class='align-middle' style="width: 20%" scope="col">Cif</th>
                                                <th class='align-middle' style="width: 20%" scope="col">Nama Lengkap</th>
                                                <th class='align-middle' style="width: 20%" scope="col">Jenis Kelamin
                                                </th>
                                                <th class='align-middle' style="width: 20%" scope="col">Alamat</th>
                                                <th class='align-middle' style="width: 10%" scope="col">Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody id="customerTableBody">

                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form action="{{ url('/customers/create-customer') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>CIF</label>
                                    <input type="text" class="form-control" name="cif" id="cif" readonly
                                        disabled>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Nama Lengkap</label>
                                    <input type="text" class="form-control" name="namalengkap" id="namalengkap" readonly
                                        disabled>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Jenis Kelamin</label>
                                    <input type="text" class="form-control" name="jk" id="jk" readonly
                                        disabled>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Alamat</label>
                                    <input type="text" class="form-control" name="alamat" id="alamat" readonly
                                        disabled>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" id="button-submit" disabled>Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script>
        $("#findCustomer").on("click", function() {
            let customerName = $("#customerName").val()
            let csrfToken = $('meta[name="csrf-token"]').attr('content')

            $.ajax({
                url: "{{ url('/customers/find-customer') }}",
                data: {
                    customer_name: customerName,
                    _token: csrfToken
                },
                type: "POST",
            }).then((result) => {
                let data = JSON.parse(result)

                if (data.customers.length !== 0) {
                    let no = 0
                    let table_html = ""
                    for (let i = 0; i < data.customers.length; i++) {
                        var alamat = data.customers[i].alamat;
                        var maxLength = 25;
                        if (alamat.length > maxLength) {
                            alamat = alamat.slice(0, maxLength) + "...";
                        }

                        table_html += "<tr>"
                        table_html += "<td class='align-middle'>" + (++no) + "</td>"
                        table_html += "<td class='align-middle'>" + data.customers[i].cif + "</td>"
                        table_html += "<td class='align-middle'>" + data.customers[i].namalengkap + "</td>"
                        table_html += "<td class='align-middle'>" + data.customers[i].kodejnskelamin +
                            "</td>"
                        table_html += "<td class='align-middle'>" + alamat + "</td>";
                        table_html += "<td><button id='" + data.customers[i].cif +
                            "' class='btn btn-primary choose-btn'>Choose</button></td>"
                        table_html += "</tr>"
                    }
                    $("#customerTableBody").html(table_html)
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Data Tidak Ditemukan!',
                    })
                }
            }).catch((err) => {
                console.log('Error While Ajax ', err)
            })
        });

        $(document).on("click", ".choose-btn", function() {
            let cif = $(this).attr('id');
            $("#searchCustomerModal").modal('hide');

            $.ajax({
                url: "{{ url('/customers/select-customer') }}",
                data: {
                    cif: cif
                },
                type: "GET"
            }).then((result) => {
                let data = JSON.parse(result)
                var kodeJnsKelamin = data.customer.kodejnskelamin;
                var jenisKelamin = kodeJnsKelamin === 'L' ? 'Laki-Laki' : (kodeJnsKelamin === 'P' ?
                    'Perempuan' : '');

                $("#cif").removeAttr('disabled')
                $("#namalengkap").removeAttr('disabled')
                $("#alamat").removeAttr('disabled')
                $("#jk").removeAttr('disabled')
                $("#button-submit").removeAttr('disabled')

                $("#cif").val(data.customer.cif)
                $("#namalengkap").val(data.customer.namalengkap)
                $("#jk").val(jenisKelamin);
                $("#alamat").val(data.customer.alamat + " " + data.customer.kelurahan + " " + data.customer
                    .kecamatan + " " + data.customer.kota)
            })
        });
    </script>
@endsection
