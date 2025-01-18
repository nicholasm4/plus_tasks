import request from '@/utils/request'

// 查询项目列表
export function listTask(query) {
  return request({
    url: '/pms/task/list',
    method: 'get',
    params: query
  })
}

// 查询项目详细
export function getTask(id) {
  return request({
    url: '/pms/task/detail?id=' + id,
    method: 'get'
  })
}

export function getTaskBurnDownChartData(id) {
  return request({
    url: '/pms/task/getTaskBurnDownChartData?projectId=' + id,
    method: 'get'
  })
}



// 新增项目
export function saveTask(data) {
  return request({
    url: '/pms/task/save',
    method: 'post',
    data: data
  })
}


export function updateProgress(data) {
  return request({
    url: '/pms/task/updateProgress',
    method: 'post',
    data: data
  })
}

export function assignUser(data) {
  return request({
    url: '/pms/task/assignUser',
    method: 'post',
    data: data
  })
}


// 修改项目
export function updateTask(data) {
  return request({
    url: '/pms/task/save',
    method: 'post',
    data: data
  })
}

// 删除项目
export function delTask(ids) {
  //判断ids是否为数组
  if(typeof ids === 'string'){
    ids = [ids]
  }
  return request({
    url: '/pms/task/delete',
    method: 'post',
    data: ids
  })
}

export function updatePlan(row) {
  return request({
    url: '/pms/task/updateplan',
    method: 'post',
    data: row
  })
}

export function updateSortNum(row) {
  return request({
    url: '/pms/task/updatesortnum',
    method: 'post',
    data: row
  })
}
