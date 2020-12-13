<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Salon
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller REST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */
use chriskacerguis\RestServer\RestController;
class Salon extends RestController
{
    
  public function __construct()
  {
    parent::__construct();
    $this->load->model('Salon_model');
    $this->methods['index_get']['limit'] = 2;
  }

  public function index_get(){
    $id = $this->get('id',true);
    if($id === null){
      $p = $this->get('page');
      $p = (empty($p) ? 1 : $p);
      $total_data = $this->Salon_model->count();
      $total_page = ceil($total_data / 5);
      $start = ($p - 1)* 5;
      $list = $this->Salon_model->get(null, 5, $start);
      if($list){
        $data = [
          'status' =>true,
          'page' => $p,
          'total_data' => $total_data,
          'total_page' => $total_page,
          'data' => $list
        ];
      } else{
        $data = [
          'status'=> false,
          'msg' => 'Data tidak ditemukan'
        ];
      }
      $this->response($data,RestController::HTTP_OK);
    } else{
        $data = $this->Salon_model->get($id);
        if($data){
          $this->response(['status'=>true,'data'=>$data], RestController::HTTP_OK);
        } else{
          $this->response(['status'=>false,'msg'=> $id . 'tidak ditemukan'],RestController::HTTP_NOT_FOUND);
        }
    }  
  }

  public function index_post(){
    $data = [
      'ID_salon' => $this->put('ID', true),
      'nama_salon' => $this->put('salon', true),
      'kota' => $this->put('kota', true),
      'alamat' => $this->put('alamat', true),
      'telepon' => $this->put('telepon', true)
    ];
    $simpan = $this->Salon_model->add($data);
    if($simpan['status']){
      $this->response(['status'=> true,'msg' => $simpan['data'] . ' Data telah ditambahkan' ], RestController::HTTP_CREATED);
    } else{
      $this->response(['status'=> false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_put()
  {
    $data = [
      'ID_salon' => $this->put('ID', true),
      'nama_salon' => $this->put('salon', true),
      'kota' => $this->put('kota', true),
      'alamat' => $this->put('alamat', true),
      'telepon' => $this->put('telepon', true)
    ];
    $id = $this->put('ID', true);
    if ($id === null) {
      $this->response(['status' => false, 'msg' => 'Masukkan ID yang akan diubah'], RestController::HTTP_BAD_REQUEST);
    }
    $simpan = $this->Salon_model->update($id, $data);
    if ($simpan['status']) {
      $status = (int)$simpan['data'];
      if ($status > 0)
        $this->response(['status' => true, 'msg' => $simpan['data'] . ' Data telah diubah'], RestController::HTTP_OK);
      else
        $this->response(['status' => false, 'msg' => 'Tidak ada data yang diubah'], RestController::HTTP_BAD_REQUEST);
    } else {
      $this->response(['status' => false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_delete(){
    $id = $this->delete('ID',true);
    if($id === null){
      $this->response(['status'=> false, 'msg' => 'Masukkan ID yang akan dihapus'], RestController::HTTP_BAD_REQUEST);
    }
    $delete = $this->Salon_model->delete($id);
    if($delete['status']){
      $status = (int)$delete['data'];
        if($status > 0)
          $this->response(['status'=> true,'msg' => $id . ' Data telah dihapus'], RestController::HTTP_OK);
        else
          $this->response(['status'=> false, 'msg' => 'Tidak ada data yang dihapus'], RestController::HTTP_BAD_REQUEST);
    } else{
      $this->response(['status'=> false, 'msg' => $delete['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }
}


/* End of file Salon.php */
/* Location: ./application/controllers/Salon.php */