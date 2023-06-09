<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class WithdrawRequest extends Model
{

    protected $guarded = ['id'];

    protected $casts = [
        'amount' => 'float',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function seller(){
        return $this->belongsTo(Seller::class,'seller_id');
    }

    public function delivery_men(){
        return $this->belongsTo(DeliveryMan::class,'delivery_man_id');
    }
}
