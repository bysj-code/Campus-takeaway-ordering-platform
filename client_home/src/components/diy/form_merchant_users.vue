<template>
	<div>
			<view v-if="$check_register_field('add','store_name','/merchant_users/view')" class="col-12 col-md-6">
			<view class="diy_title">
				<text>
					店铺名称:
				</text>
			</view>
									<!-- 文本 -->
				<view class="diy_field diy_text">
					<input type="text" id="form_store_name" v-model="form['store_name']" @blur="handleBlur($event.target.value,'store_name')"  placeholder="请输入店铺名称" />
				</view>
							</view>
				<view v-if="$check_register_field('add','merchant_name','/merchant_users/view')" class="col-12 col-md-6">
			<view class="diy_title">
				<text>
					商家姓名:
				</text>
			</view>
									<!-- 文本 -->
				<view class="diy_field diy_text">
					<input type="text" id="form_merchant_name" v-model="form['merchant_name']" @blur="handleBlur($event.target.value,'merchant_name')"  placeholder="请输入商家姓名" />
				</view>
							</view>
				<view v-if="$check_register_field('add','merchant_gender','/merchant_users/view')" class="col-12 col-md-6">
			<view class="diy_title">
				<text>
					商家性别:
				</text>
			</view>
					<!-- 选项 -->
			<view class="diy_field diy_down">
				<uni-data-select
						id="form_merchant_gender"
						v-model="form['merchant_gender']"
						:localdata="list_merchant_gender"
						@change="change_merchant_gender"
				></uni-data-select>
			</view>
				</view>
		</div>
</template>

<script>
	export default {
		model: {
			prop: "form",
			event: "change"
		},
		props: {
			form: {
				type: Object,
				default: ()=>{
					return {
						url_upload: "~/api/merchant_users/upload?",
					}
				}
			}
		},
		data(){
			return {
									"list_merchant_gender": [],
						}
		},
		methods: {
						/**
			 * 获取商家性别列表
			 */
			async get_list_merchant_gender() {
									['男','女'].map((o) => this.list_merchant_gender.push({value:o,text:o}));
											},
			change_merchant_gender(val) {
				if (val === "全部" || val === "") {
					this.$emit('change',{"value":"","type":"merchant_gender"})
				}else{
					this.$emit('change',{"value":val,"type":"merchant_gender"})
				}
			},
				/**
			 * 上传图片
			 * @param {Object} param文件参数
			 */
			change_img(key_name){
				var _self = this;
				_self.upload_img_flag = false
				// 选择图像方法
				uni.chooseImage({
					count: 1,
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album'], //从相册选择
					success: function(res) {
						const tempFilePaths = res.tempFilePaths;
						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl('/api/merchant_users/upload?'),
							filePath: tempFilePaths[0],
							name: 'file',
							formData: {
								'i_want_to_customize': 'test'
							},
							header: {
								'x-auth-token': "null"
							},
							success: function(uploadFileRes) {
								var filename = JSON.parse(uploadFileRes.data).result.url
								_self.$delete(_self.form,key_name);
								_self.$set(_self.form,key_name,filename);
								_self.handleBlur(filename,key_name);
							}
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log('上传进度' + res.progress);
							console.log('已经上传的数据长度' + res.totalBytesSent);
							console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
						});
					},
					error: function(e) {
						console.log(e);
					}
				});
			},
			handleBlur(value,type){
				this.$emit('change',{value,type})
			}
		},
    mounted(){
								this.get_list_merchant_gender();
				}
	}
</script>

<style>
.col-md-6{
	display: flex;
	margin-bottom: 1.25rem;
	height: 36px;
}
.diy_title{
	/* flex: 1.2; */
	display: inline-block;
	width: 5.0625rem;
	margin-right: 0.3125rem;
	font-size: 0.875rem;
    color: #333;
		padding-top: 0.3125rem;
}
.diy_field{
	/* flex: 5; */
	display: inline-block;
	width: 100%;
	background: #ffffff;
	height: 2.25rem;
	line-height:  2.25rem;
	border-radius: 0.25rem;
	padding-left: 0.625rem;


	}
	.diy_field input{
		display: inline;
		font-size: 0.875rem;
	}
</style>
