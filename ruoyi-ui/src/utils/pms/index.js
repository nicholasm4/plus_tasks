import moment from "moment/moment";

export function formatDate(cellValue) {


}

function  listToTreeForPlan(lis) {

  //第一种格式：普通List
  let list = deepCopyTaskList(lis);

  //创建一个map，用于存储id和节点之间的映射关系
  let map = {};
  // 遍历列表，创建节点对象，并添加到map中
  list.forEach(item => {
    item.children = [];
    item.child = [];
    map[item.id] = item;
  });

  //遍历列表，将每个节点添加到对应的父节点的children属性中
  list.forEach(item => {
    //设置树节点
    if (item.predecessorId && map[item.predecessorId]) {
      map[item.predecessorId].child.push(item);
    }
    if (item.pId && map[item.pId]) {
      map[item.pId].children.push(item);
    }

  });

  //第二种格式:树格式（按Pid）
  let tree2 = list.filter(taskListVm => !taskListVm.pId);

  //第三种格式:树格式（按前置任务）
  let tree3 = list.filter(taskListVm => !taskListVm.predecessorId);

  //第四种格式（叶节点路径）
  let leafPaths = this.getLeafPaths(tree3);


  //设置前置任务编号
  list.forEach(item => {
    if (item.predecessorId && map[item.predecessorId]) {
      let predecessorTask = map[item.predecessorId];
      item.predecessor = list.indexOf(predecessorTask) + 1;
    }
  });

  //设置日期，设置工期
  leafPaths.forEach(arr => {
    let pre = null;
    arr.forEach(item => {
      if (item.taskType === '1') {
        //手动任务
        console.info(item);
        let itemStartDate = new Date(item.startDate);
        let itemEndDate = new Date(item.endDate);
        //开始时间-结束时间=工期
        item.duration = Math.ceil((itemEndDate.getTime() - itemStartDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
      } else {
        //自动任务
        if (!item.duration) {
          item.duration = 1;
        }
        //判断是否第一条
        //判断是否有工期
        if (pre === null) {
          //1999年1月1日
          item.startDate = new Date(1999, 1, 1);
          //结束时间等于开始时间 加工期
          item.endDate = new Date(item.startDate.getTime() + item.duration * 24 * 60 * 60 * 1000);
          item.predecessorId = null;
          item.predecessor = "";
        } else {
          //前置任务的结束时间等于当前任务的开始时间+1天等于开始时间
          if (pre.taskType === '1') {
            let preEndDate = new Date(pre.endDate);
            preEndDate.setHours(17);
            preEndDate.setMinutes(0);
            preEndDate.setSeconds(0);
            item.startDate = this.addWorkDays(preEndDate, 1)
            item.startDate.setHours(8);
            item.startDate.setMinutes(0);
            item.startDate.setSeconds(0);
          } else {
            let preEndDate = new Date(pre.endDate);
            item.startDate = new Date(preEndDate.getTime());
          }
          item.endDate = this.addWorkDays(item.startDate, item.duration)
          console.info(item.startDate)
          console.info(item.endDate)
          console.info("----------------")
        }
      }
      pre = item;
    })
  })


  let root2 = {};
  root2.taskName = "root"
  root2.id = "0";
  root2.children = tree2;
  // 从叶节点向上层遍历
  this.traverseUpFromLeaf(root2, (node) => {
    if (node.children.length === 0) {
      return;
    }
    if (node.taskType === '1') {
      return;
    }
    let minStartDate = this.getEarliestStartDateNode(node.children).startDate;
    let maxEndDate = this.getLatestEndDateNode(node.children).endDate;
    node.startDate = new Date(minStartDate);
    node.endDate = new Date(maxEndDate);
    node.duration = Math.ceil((node.endDate.getTime() - node.startDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
  });


  //设置ID
  this.timeNum = new Date().getTime();
  list.forEach(item => {
    item.id = item.id + "|" + this.timeNum;
    if (item.pId) {
      item.pId = item.pId + "|" + this.timeNum;
    }
    if (item.predecessorId) {
      item.predecessorId = item.predecessorId + "|" + this.timeNum;
    }
  });

  //更新展开数
  let l = this.expandRowKeys.map(item => this.removeAfterPipe(item));
  this.expandRowKeys = l.map(item => item + "|" + this.timeNum);

  this.dataList = list;
  this.dataList2 = leafPaths;
  this.dataTree = tree2;
  this.dataList2 = tree3;

  // let minStartDate = this.getEarliestStartDateNode(this.dataTree).startDate;
  // console.info("minStartDate" + minStartDate);
  // let maxEndDate = this.getLatestEndDateNode(this.dataTree).endDate;
  // console.info("maxEndDate" + maxEndDate);

}
function deepCopyTaskList(obj) {
  let list = [];
  obj.forEach(item => {
    let row = {};
    row.id = this.removeAfterPipe(item.id);
    row.pId = this.removeAfterPipe(item.pId);
    row.predecessorId = this.removeAfterPipe(item.predecessorId);
    row.startDate = moment(item.startDate).format('YYYY-MM-DD HH:mm:ss');
    row.endDate = moment(item.endDate).format('YYYY-MM-DD HH:mm:ss');
    row.duration = item.duration;
    row.taskType = item.taskType;
    row.taskName = item.taskName;
    row.assignUserId = item.assignUserId;
    list.push(row);
  });
  return list;
}
function removeAfterPipe(str) {
  if (str === null) {
    return null;
  }
  const index = str.indexOf('|'); // 找到 '|' 字符的位置
  if (index !== -1) {
    return str.substring(0, index); // 截取 '|' 字符之前的部分
  } else {
    return str; // 如果没有 '|' 字符，直接返回原始字符串
  }
}

function getLatestEndDateNode(children) {
  let latestNode = null;
  //2222年
  let latestEndDate;
  // 遍历子节点
  children.forEach(child => {
    child.endDate = new Date(child.endDate)
    if (!latestNode || child.endDate.getTime() > latestEndDate.getTime()) {
      latestNode = child;
      latestEndDate = new Date(child.endDate);
    }
  });
  return latestNode;
}
function getEarliestStartDateNode(children) {
  let earliestNode = null;
  //1991年
  let earliestStartDate;
  // 遍历子节点
  children.forEach(child => {
    child.startDate = new Date(child.startDate)
    if (!earliestNode || child.startDate.getTime() < earliestStartDate.getTime()) {
      earliestNode = child;
      earliestStartDate = new Date(child.startDate);
    }
  });
  return earliestNode;
}
function traverseUpFromLeaf(node, callback) {
  if (!node.children || node.children.length === 0) {
    // 如果当前节点没有子节点，调用回调函数
    callback(node);
  } else {
    // 遍历当前节点的子节点
    node.children.forEach(child => {
      // 递归调用自身，向下遍历子节点
      this.traverseUpFromLeaf(child, callback);
    });
    // 遍历完所有子节点后，调用回调函数
    callback(node);
  }
}
