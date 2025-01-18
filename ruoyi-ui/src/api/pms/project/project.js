import request from '@/utils/request'

// 查询项目列表
export function listProject(query) {
  return request({
    url: '/pms/project/page',
    method: 'get',
    params: query
  })
}

// 查询项目详细
export function getProject(id) {
  return request({
    url: '/pms/project/detail?id=' + id,
    method: 'get'
  })
}

export function getWorkStationCount() {
  return request({
    url: '/pms/project/getWorkStationCount',
    method: 'get'
  })
}



// 新增项目
export function addProject(data) {
  return request({
    url: '/pms/project/save',
    method: 'post',
    data: data
  })
}

// 修改项目
export function updateProject(data) {
  return request({
    url: '/pms/project/save',
    method: 'post',
    data: data
  })
}



// 删除项目
export function delProject(ids) {
  //判断ids是否为数组

  if (typeof ids === 'string') {
    ids = [ids]
  }

  return request({
    url: '/pms/project/delete',
    method: 'post',
    data: ids
  })
}


export function operateProject(dm) {
  //判断ids是否为数组
  return request({
    url: '/pms/project/operate',
    method: 'post',
    data: dm
  })
}

