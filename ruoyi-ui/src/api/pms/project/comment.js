import request from '@/utils/request'

// 查询项目列表
export function listComment(moduleId) {
  return request({
    url: '/pms/comment/listComment',
    method: 'get',
    params: { moduleId }
  })
}


// 新增项目
export function saveComment(data) {
  return request({
    url: '/pms/comment/saveComment',
    method: 'post',
    data: data
  })
}




// 删除项目
export function deleteComment(ids) {
  //判断ids是否为数组

  if (typeof ids === 'string') {
    ids = [ids]
  }

  return request({
    url: '/pms/comment/deleteComment',
    method: 'post',
    data: ids
  })
}

