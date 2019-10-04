<template>
	<div id="module_management">
		<div class="row">
			<div class="col-12 text-center mt-2">
				<div class="jumbotron bg-dark">
				  	<span class="font-weight-bolder text-light h3">Module Management</span>
				</div>
			</div>
			<div class="col-8 mb-2">
				
			</div>
			<div class="col-4 mb-2 text-right">
				<button class="btn btn-dark" data-toggle="modal" data-target="#add_modal"><span><i class="fa fa-plus"></i></span></button>
			</div>
			<div class="col-12">
				<table class="table">
				    <thead>
				        <tr>
				            <th>#</th>
				            <th>Module Code</th>
				            <th>Name</th>
				            <th>Description</th>
				            <th>
				            	<span><i class="fa fa-cog"></i></span>
				            </th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr v-for="item, key in data_module_list">
				            <td>{{ key + 1 }}</td>
				            <td>{{ item.module_code }}</td>
				            <td>{{ item.name }}</td>
				            <td>{{ item.description }}</td>
				            <td>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#update_modal" @click="openUpdate(key)"><span><i class="fa fa-edit"></i></span></button>
				            	<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#delete_modal" @click="openDelete(key)"><span><i class="fa fa-trash"></i></span></button>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<Modulepagination></Modulepagination>
				<Moduleadd></Moduleadd>
				<Moduledelete></Moduledelete>
				<Moduleupdate></Moduleupdate>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	let Modulepagination = Vue.component('Modulepagination', require('./Modulepagination.vue').default);
	let Moduleadd = Vue.component('Moduleadd', require('./Moduleadd.vue').default);
	let Moduledelete = Vue.component('Moduledelete', require('./Moduledelete.vue').default);
	let Moduleupdate = Vue.component('Moduleupdate', require('./Moduleupdate.vue').default);
	export default {
		components: {Moduleadd, Modulepagination, Moduledelete, Moduleupdate},
		data(){
			return {
				data_module_list: {
					id: '',
					module_code: '',
					name: '',
					description: '',
				},
				pagination: {
					current_page: 1,
					last_page: 1
				}
			}
		},
		mounted(){
			this.get_data_module_list()
		},
		methods: {
			get_data_module_list(){
				axios.get(`admin/get_data_module_list?page=${this.pagination.current_page}`)
				.then((response) => {
					this.data_module_list = response.data.data
					this.pagination.current_page = response.data.current_page
					this.pagination.last_page = response.data.last_page
					this.$children[0].pagination = this.pagination
				})
				.catch((error) => {
					console.log(error)
				})
			},

			openDelete(key){
				this.$children[2].id = this.data_module_list[key].id
			},

			openUpdate(key){
				this.$children[3].data_module.id = this.data_
				module_list[key].id
				this.$children[3].data_module.module_code = this.data_module_list[key].module_code
				this.$children[3].data_module.name = this.data_module_list[key].name
				this.$children[3].data_module.description = this.data_module_list[key].description
			}

		}
	}
</script>