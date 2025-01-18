import request from '@/utils/request'

// 查询项目列表
export function listResources() {
  return request({
    url: '/pms/resources/listresources',
    method: 'get'
  })
}

export function detailResources() {
  return request({
    url: '/pms/resources/detailresources',
    method: 'get'
  })
}


export function listManager(prejectId) {
  return request({
    url: '/pms/resources/listManager?projectId=' + prejectId,
    method: 'get'
  })
}

export function addManager(data) {
  return request({
    url: '/pms/resources/addManager',
    method: 'post',
    data: data
  })
}
export function deleteManager(ids) {
  //判断ids是否为数组

  if (typeof ids === 'string') {
    ids = [ids]
  }

  return request({
    url: '/pms/resources/deleteManager',
    method: 'post',
    data: ids
  })
}


