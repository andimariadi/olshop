    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
                    <?php foreach ($slide as $value) { ?>
                        <li>
                            <img src="<?php echo $value['url_image'];?>" alt="Slide <?php echo $value['name_image'];?>">
                            <div class="caption-group">
                                <h2 class="caption title">
                                    <?php echo $value['caption_title'];?>
                                </h2>
                                <h4 class="caption subtitle"><?php echo $value['caption_subtitle'];?></h4>
                                <a class="caption button-radius" href="<?php echo $value['url_product'];?>"><span class="icon"></span>Shop now</a>
                            </div>
                        </li>
                    <?php } ?>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 Days return</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Free shipping</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Secure payments</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>New products</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <?php $this->load->view('Template/sidebar');?>
                </div>
                <div class="col-md-8">
                    <h2 class="section-title">Login to Shopping</h2>
                    <?php
                    if ($this->session->flashdata('msg') != '') {
                        echo $this->session->flashdata('msg');
                    }
                    ?>
                    <form method="post" action="<?php echo base_url('Auth/action');?>">
                        <div class="form-group">
                            <label for="username">Username or email <span class="required">*</span></label>
                            <input type="text" class="form-control p_input" name="user" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password <span class="required">*</span></label>
                            <input type="password" class="form-control p_input" name="pass" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <p>No have account ? <a href="<?php echo base_url('Auth/register');?>">Click Here!</a></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="login" class="btn btn-primary">LOGIN</button>
                            <button type="reset" class="btn btn-danger">RESET</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->