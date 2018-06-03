<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dash extends CI_Controller {

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
		if($username == ''){
			redirect(base_url("Auth"));
		}
		if($level != 'admin'){
			redirect(base_url("shop"));
		}
	}

	public function index() {
		$data = array('title_head' => 'Homepage - Admin Olshop Tekno');
		$this->load->view('Template/header_admin', $data);
		$this->load->view('Admin/home');
		$this->load->view('Template/footer_admin');
	}
		
}
