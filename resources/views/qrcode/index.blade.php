@include('layouts.header')

<body class="d-flex align-items-center justify-content-center p-3">
    <div class="card">
        <div class="card-body">
            <div class="text-center">
                <img src="{{ asset('images/calendar.png') }}" alt="" width="50">
                <h2>Reservasi Ditemukan</h2>
                <hr>
            </div>
            @if ($data['description'] !== null)
                @foreach ($data['description'] as $title => $value)
                    <div class="row">
                        <div class="d-flex align-items-center col-6">
                            <p class="font-weight-bold">{{ $title }}:</p>
                        </div>
                        <div class="col-6 text-right">
                            <p>{{ is_array($value) ? $value['namabank'] : $value }}</p>
                        </div>
                    </div>
                @endforeach
            @else
                <p>Error decoding nested JSON data</p>
            @endif

            <div class="d-flex justify-content-between mt-3">
                <button class="btn btn-primary" id="acceptButton">Diterima</button>
                <button class="btn btn-danger" id="rejectButton">Tolak</button>
            </div>
        </div>
    </div>
</body>

@include('layouts.footer')

<script>
    $(document).ready(function() {
        var id = @json($data['data']->parent);

        $('#acceptButton').click(function() {
            showConfirmation('Apakah Anda yakin ingin menerima?', '/qrcode/accept/' + id);
        });

        $('#rejectButton').click(function() {
            showConfirmation('Apakah Anda yakin ingin menolak?', '/qrcode/reject/' + id);
        });

        function showConfirmation(message, url) {
            Swal.fire({
                title: 'Konfirmasi',
                text: message,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya',
                cancelButtonText: 'Tidak'
            }).then((result) => {
                if (result.isConfirmed) {
                    sendAjax(url);
                }
            });
        }

        function sendAjax(url) {
            $.ajax({
                type: 'GET',
                url: url,
            }).then(function () {
                location.reload();
            })
        }
    });
</script>
