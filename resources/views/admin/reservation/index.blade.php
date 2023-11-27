@extends('layouts.panel')

@section('title', 'Reservasi')

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <table id="datatable" class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>No</th>
                                <th>Nama Pemohon</th>
                                <th>Kantor Tujuan</th>
                                <th>Layanan Tujuan</th>
                                <th>Alasan</th>
                                <th>Tanggal</th>
                                <th>Jam</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $no = 0;
                            @endphp
                            @foreach ($datas as $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $data->first_name }}</td>
                                    <td>{{ trim(explode("-", $data->branch_id)[1] ?? '') }}</td>
                                    <td>
                                        @if ($data->destination_service == 1)
                                            Teller
                                        @elseif($data->destination_service == 2)
                                            Customer Service
                                        @elseif($data->destination_service == 3)
                                            Lainnya
                                        @else
                                            Default Value
                                        @endif
                                    </td>
                                    <td>{{ $data->reason }}</td>
                                    <td>{{ $data->day }}</td>
                                    <td>{{ $data->time }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        $('.accept').on("click", function() {
            let id = $(this).attr('id');
            confirmAction(id, 'Apakah Kamu Yakin Untuk Menerima Reservasi Ini?', 'accept');
        });

        $('.reject').on("click", function() {
            let id = $(this).attr('id');
            confirmAction(id, 'Apakah Kamu Yakin Untuk Menolak Reservasi Ini?', 'reject');
        });

        function confirmAction(id, message, actionType) {
            Swal.fire({
                title: message,
                text: "Perubahaan Tidak Bisa Diganti!",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.isConfirmed) {
                    executeAction(id, actionType);
                }
            });
        }

        function executeAction(id, actionType) {
            let url = `{{ url('/reservation/') }}/${actionType}`;
            console.log(url);

            $.ajax({
                url: url,
                data: {
                    id: id
                },
                type: "GET"
            }).then(() => {
                window.location.reload();
            }).catch((err) => {
                console.log(`Error While ${actionType}ing Reservation: `, err);
            });
        }
    </script>
@endsection
