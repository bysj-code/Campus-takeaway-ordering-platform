<template>
	<view class="diy_details diy_div_delivery_order">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','order_number')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>订单编号:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["order_number"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','store_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>店铺名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["store_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','merchant_users')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>商家用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_merchant_users(obj['merchant_users']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','food_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>美食名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["food_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','food_types')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>美食类型:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["food_types"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','food_prices')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>美食价格:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["food_prices"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','student_users')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>学生用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_student_users(obj['student_users']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','student_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>学生姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["student_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','contact_number')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>联系电话:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["contact_number"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','shipping_address')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>收货地址:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["shipping_address"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','purchase_quantity')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>购买数量:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["purchase_quantity"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','delivery_users')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>配送用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_delivery_users(obj['delivery_users']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','delivery_status')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>配送状态:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["delivery_status"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','delivery_description')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>配送描述:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["delivery_description"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','receiving_status')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>收货状态:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["receiving_status"]}}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/message_information/edit')" v-if="$check_action('/message_information/edit','add') || $check_action('/message_information/edit','set')" >留言</button>
					</view>
				</view>
			</view>
		</view>
		</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						delivery_order_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
							// 用户列表
				list_user_merchant_users: [],
									// 用户列表
				list_user_student_users: [],
										// 用户列表
				list_user_delivery_users: [],
							}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/delivery_order/get_obj", {
					delivery_order_id:this.query.delivery_order_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
						/**
			 * 获取商家用户用户列表
			 */
			async get_list_user_merchant_users() {
				var json = await this.$get("~/api/user/get_list?user_group=商家用户");
				if(json.result && json.result.list){
					this.list_user_merchant_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_merchant_users(id){
				let obj = this.list_user_merchant_users;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
								/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_student_users() {
				var json = await this.$get("~/api/user/get_list?user_group=学生用户");
				if(json.result && json.result.list){
					this.list_user_student_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_student_users(id){
				let obj = this.list_user_student_users;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
									/**
			 * 获取配送用户用户列表
			 */
			async get_list_user_delivery_users() {
				var json = await this.$get("~/api/user/get_list?user_group=配送用户");
				if(json.result && json.result.list){
					this.list_user_delivery_users = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_delivery_users(id){
				let obj = this.list_user_delivery_users;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
						},
		created() {
						this.get_list_user_merchant_users();
								this.get_list_user_student_users();
									this.get_list_user_delivery_users();
						},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["delivery_order_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_delivery_order_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
