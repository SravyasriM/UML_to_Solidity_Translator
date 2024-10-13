pragma solidity 0.7.5;

//package Others


import "java/util.sol";

import "java/util/ArrayList.sol";

import "java/util/Comparator.sol";

import "java/util/Scanner.sol";

contract Process
{
	int32 public  pid;

	int32 public  arrivalTime;

	int32 public  burstTime;

	int32 public  priority;

	int32 public  turnAroundTime;

	int32 public  waitTime;

	int32 public  remainingTime;

}

library Process_Library
{
}

contract Schedule
{
	int32 private  noOfProcess;

	int32 private  timer = int32(0);

	ArrayList private  processes;

	ArrayList private  remainingProcess;

	ArrayList private  gantChart;

	int32 private  burstAll;

	Map private  arrivals;

	function startScheduling() internal
	{
			while(!(arrivals.size() == 0 && remainingProcess.size() == 0);)
			{
					removeFinishedProcess();
					if(arrivals.get(timer) != none)
					{
							remainingProcess.addAll(arrivals.get(timer));
							arrivals.remove(timer);
					}
					int32 k = int32(timeElapsed(timer));
					ageing(k);
					timer++;

			}
			System.out.println("Total time required: " + (timer - 1));
	}

	function removeFinishedProcess() internal
	{
			ArrayList completed;
			for(int32 i = int32(0); i < remainingProcess.size(); i++;)
			{
					if(remainingProcess.get(i).remainingTime == 0)
					{
							completed.add(i);
					}
			}
			for(int32 i = int32(0); i < completed.size(); i++;)
			{
					int32 pid = int32(remainingProcess.get(completed.get(i)).pid);
					processes.get(pid).waitTime = remainingProcess.get(completed.get(i)).waitTime;
					remainingProcess.remove(remainingProcess.get(completed.get(i)));
			}
	}

	function timeElapsed(int32 i) public returns(int32)
	{
			if(!remainingProcess.isEmpty();)
			{
					gantChart.add(i, remainingProcess.get(0).pid);
					remainingProcess.get(0).remainingTime--;
					return 1;
			}
			return 0;
	}

	function ageing(int32 k) public
	{
			for(int32 i = int32(k); i < remainingProcess.size(); i++;)
			{
					remainingProcess.get(i).waitTime++;
					if(remainingProcess.get(i).waitTime % 7 == 0)
					{
							remainingProcess.get(i).priority--;
					}
			}
	}

	function solve() public
	{
			System.out.println("Gant chart ");
			for(int32 i = int32(0); i < gantChart.size(); i++;)
			{
					System.out.print(gantChart.get(i) + " ");
			}
			System.out.println();
			int32 waitTimeTot = int32(0); //Converted from FLOAT TYPE of Java
			int32 tatTime = int32(0); //Converted from FLOAT TYPE of Java
			for(int32 i = int32(0); i < noOfProcess; i++;)
			{
					processes.get(i).turnAroundTime = processes.get(i).waitTime + processes.get(i).burstTime;
					waitTimeTot += processes.get(i).waitTime;
					tatTime += processes.get(i).turnAroundTime;
					System.out.println("Process no.: " + i + " Wait time: " + processes.get(i).waitTime + " Turn Around Time: " + processes.get(i).turnAroundTime);
			}
			System.out.println("Average Waiting Time: " + waitTimeTot / noOfProcess);
			System.out.println("Average TAT Time: " + tatTime / noOfProcess);
			System.out.println("Throughput: " + int32(noOfProcess) / (timer - 1));
	}

	constructor() internal
	{
			Scanner in;
			;
			;
			;
			;
			System.out.print("Enter the no. of processes: ");
			noOfProcess = in.nextInt();
			System.out.println("Enter the arrival, burst and priority of processes");
			for(int32 i = int32(0); i < noOfProcess; i++;)
			{
					Process p = new Process();
					p.pid = i;
					p.arrivalTime = in.nextInt();
					p.burstTime = in.nextInt();
					p.priority = in.nextInt();
					p.turnAroundTime = 0;
					p.waitTime = 0;
					p.remainingTime = p.burstTime;
					if(arrivals.get(p.arrivalTime) == none)
					{
					}
					arrivals.get(p.arrivalTime).add(p);
					processes.add(p);
					burstAll += p.burstTime;
			}
			in.close();
	}

}

library Schedule_Library
{
}

contract SJF
{
}

library SJF_Library
{
	function main(string[] memory args) public
	{
			Schedule s = new Schedule();
			s.startScheduling();
			s.solve();
	}

}

