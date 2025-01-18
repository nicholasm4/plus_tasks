import request from '@/utils/request'

// 获取工作周列表
export function getWorkWeeklist(calendarId) {
  return request({
    url: '/pms/calendar/getWorkWeeklist',
    method: 'get',
    params: { calendarId }
  });
}

// 获取工作日期列表
export function getWorkDatelist(calendarId) {
  return request({
    url: '/pms/calendar/getWorkDatelist',
    method: 'get',
    params: { calendarId }
  });
}

export function getWorkTimelist(calendarId) {
  return request({
    url: '/pms/calendar/getWorkTimelist',
    method: 'get',
    params: { calendarId }
  });
}

// 获取异常日期列表
export function getExceptionDatelist(calendarId) {
  return request({
    url: '/pms/calendar/getExceptionDatelist',
    method: 'get',
    params: { calendarId }
  });
}

// 保存工作周
export function saveWorkWeek(dm) {
  return request({
    url: '/pms/calendar/saveWorkWeek',
    method: 'post',
    data: dm
  });
}

// 保存工作日期
export function saveWorkDate(dm) {
  return request({
    url: '/pms/calendar/saveWorkDate',
    method: 'post',
    data: dm
  });
}

export function saveWorkTime(dm) {
  return request({
    url: '/pms/calendar/saveWorkTime',
    method: 'post',
    data: dm
  });
}

// 保存异常日期
export function saveExceptionDate(dm) {
  return request({
    url: '/pms/calendar/saveExceptionDate',
    method: 'post',
    data: dm
  });
}

// 删除工作日期
export function deleteWorkDate(ids) {
  if(typeof ids === 'string'){
    ids = [ids]
  }
  return request({
    url: '/pms/calendar/deleteWorkDate',
    method: 'post',
    data: ids
  });
}

export function deleteWorkTime(ids) {
  if(typeof ids === 'string'){
    ids = [ids]
  }
  return request({
    url: '/pms/calendar/deleteWorkTime',
    method: 'post',
    data: ids
  });
}

// 删除异常日期
export function deleteExceptionDate(ids) {
  if(typeof ids === 'string'){
    ids = [ids]
  }
  return request({
    url: '/pms/calendar/deleteExceptionDate',
    method: 'post',
    data: ids
  });
}
