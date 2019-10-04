<template>
	<div id="student_information">
		<div class="row">
			<div class="col-12 text-center mt-2">
				<div class="jumbotron bg-dark">
				  	<span class="font-weight-bolder text-light h3">Student Information</span>
				</div>
			</div>
			<div class="col-12 text-right">
				<button class="btn btn-dark" data-toggle="modal" data-target="#update_modal" @click="openUpdateInformation"><span><i class="fa fa-edit"></i></span> Update Info</button>
			</div>
			<div class="col-md-6 text-center mt-2 mb-2">
				<div class="card">
				    <img class="card-img-top" v-bind:src="'uploads/students/' + data_student.image">
				    <div class="card-body">
				        <h4 class="card-title">{{ data_student.name }}</h4>
				    </div>
				</div>
			</div>
			<div class="col-md-6 mt-2 mb-2">
				<div class="card">
				    <div class="card-body">
				    	<span class="font-weight-bolder">Student Code</span><br>
				    	<span class="font-italic">{{ data_student.student_code }}</span><br>
				    	<span class="font-weight-bolder">Name</span><br>
				    	<span class="font-italic">{{ data_student.name }}</span><br>	
				    	<span class="font-weight-bolder">Email</span><br>
				    	<span class="font-italic">{{ data_student.email }}</span><br>
				    	<span class="font-weight-bolder">Address</span><br>
				    	<span class="font-italic">{{ data_student.address }}</span><br>	
				    	<span class="font-weight-bolder">Phone</span><br>
				    	<span class="font-italic">{{ data_student.phone }}</span><br>				       
				    </div>
				</div>
			</div>
		</div>
		<Updateinformation></Updateinformation>
	</div>
</template>

<script type="text/javascript">
	let Updateinformation =  Vue.component('Updateinformation', require('./Updateinformation.vue').default);
	export default {
		components: {Updateinformation},
		data(){
			return {
				// data_user: {},
				data_student: {
					student_id: '',
					student_code: '',
					email: '',
					name: '',
					address: '',
					phone: '',
					image: ''
				}
			}
		},
		mounted(){
			this.get_data_student()
		},
		methods : {
			get_data_student(){
				axios.get('student/get_student_info')
				.then((response) => {
					this.data_student.student_id = response.data[1].id
					this.data_student.student_code = response.data[1].student_code
					this.data_student.email = response.data[0].email
					this.data_student.name = response.data[1].name
					this.data_student.address = response.data[1].address
					this.data_student.phone = response.data[1].phone
					this.data_student.image = response.data[1].image
				})
				.catch((error) => {
					console.log(error)
				})
			},
			openUpdateInformation(){
				this.$children[0].data_student.student_id = this.data_student.student_id
				this.$children[0].data_student.student_code = this.data_student.student_code
				this.$children[0].data_student.email = this.data_student.email
				this.$children[0].data_student.name = this.data_student.name
				this.$children[0].data_student.address = this.data_student.address
				this.$children[0].data_student.phone = this.data_student.phone
				this.$children[0].data_student.image = this.data_student.image
			}
		}
	}
</script>