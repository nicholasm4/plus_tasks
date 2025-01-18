import request from '@/utils/request'

// 查询项目列表
export function getProjectDynamics(projectId) {
  return request({
    url: '/pms/dynamics/getProjectDynamics?projectId='+projectId,
    method: 'get'
  })
}

