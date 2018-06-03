<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

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
	}

	public function index () {
		$data = array('title_head' => 'Login - Olshop Tekno');
		$this->load->view('Template/header', $data);
		//login
		$slide = $this->Crud->view('slide');
		$data  = array('slide' => $slide);
		$this->load->view('Auth/login', $data);
		$this->load->view('Template/footer');
	}

	public function register () {
		$data = array('title_head' => 'Register - Olshop Tekno');
		$this->load->view('Template/header', $data);
		/*
		$this->Crud->insert('user_login', array('username' => 'andi_mariadi'));
		echo $this->db->insert_id();
		*/
		$this->load->view('Auth/register');
		$this->load->view('Template/footer');
	}

	public function action () {
		$user = $this->input->post('user');
		$pass = $this->input->post('pass');
		$where = array('username' => $user);
		$data = $this->Crud->search('user_login', $where)->row_array();
		if (password_verify($pass, $data['password'])) {
			$session_data = array('id_user' => $data['id'], 'username' => $data['username'], 'level' => $data['level']);
			$this->session->set_userdata($session_data);
			redirect(base_url('Dash'));
		} else {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username or password wrong!</div>');
			redirect(base_url('Auth'));
		}
	}

	public function action_register () {
		$username 		= $this->input->post('username');
		$first_name 	= $this->input->post('first_name');
		$last_name 		= $this->input->post('last_name');
		$address 		= $this->input->post('address_1') . ' ' . $this->input->post('address_2');
		$country 		= $this->input->post('country');
		$postcode 		= $this->input->post('postcode');
		$email 			= $this->input->post('email');
		$phone 			= $this->input->post('phone');
		$password 		= password_hash($this->input->post('password'), PASSWORD_DEFAULT);
		$register 		= $this->input->post('register');
		if ($register != '') {
			$search 	= array('username' => $username);
			$data = $this->Crud->search('user_login', $search);
			if (count($data) > 0) {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert"><strong>Wrong!</strong> Your ussername already exits!</div>');
				redirect(base_url('Auth/register'));
			} else {
				//insert to userlogin
				$data_login 	= array('username' => $username, 'password' => $password, 'level' => 'user');
				$this->Crud->insert('user_login', $data_login);
				//insert to user_data
				$id_user		= $this->db->insert_id();
				$data_user 	= array(
					'id_user ' 		=> $id_user,
					'first_name' 	=> $first_name,
					'last_name' 	=> $last_name,
					'email' 		=> $email,
					'phone' 		=> $phone,
					'address' 		=> $address,
					'country' 		=> $country,
					'zip_code' 		=> $postcode,
				);
				$this->Crud->insert('data_user', $data_user);
				$this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert"><strong>Great!</strong> Your account has registered, please login here!</div>');
				redirect(base_url('Auth'));
			}
		}
	}

	public function logout() {
		$this->session->sess_destroy();
		redirect(base_url());
	}
}
