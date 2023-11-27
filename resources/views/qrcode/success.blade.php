@include('layouts.header')

<body class="d-flex align-items-center justify-content-center p-3">
    <div class="card">
        <div class="card-body">
            <div class="text-center">
                <img src="{{ asset('images/check.png') }}" alt="" width="50">
                <h2>Reservasi Diterima</h2>
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
        </div>
    </div>
</body>

@include('layouts.footer')

<script>
</script>
