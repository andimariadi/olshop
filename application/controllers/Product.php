<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct() {
		parent::__construct();
		$username 	= $this->session->userdata('username');
		$level 		= $this->session->userdata('level');
	}

	public function index($id = '', $linkname = '') {
		$data = array('title_head' => 'Homepage - Olshop Tekno');
		$this->load->view('Template/header', $data);
		//login
		$slide = $this->Crud->view('slide');
		$data  = array('slide' => $slide);
		$this->load->view('Shop/home', $data);
		$this->load->view('Template/footer');
	}
}
