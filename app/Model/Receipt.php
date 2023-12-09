<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receipt extends Model
{
    use HasFactory;
    // protected $casts = [
    //     'exchange_rate' => 'float',
    //     'status'        => 'integer',
    //     'created_at'    => 'datetime',
    //     'updated_at'    => 'datetime',
    // ];
    protected $table = 'receipt';
}
