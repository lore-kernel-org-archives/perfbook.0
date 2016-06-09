Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pDCFrDl3xkOhvmvbzoosho1jMwWCJuL4TyAn5Azklz0=;
 b=ZNrshTCGgMIexHqb6RlNgqs+bKcFm6F7rOTZEBVTM7DQfbiSHHbNwOZvh8pqjHtBFC
 A7jikckBUcz518Bm+3mUo9mX8L2LrJi0GLOJm3x04fHZQBQXXsZnIpSXPnmMW6mogifd
 IF1oEgHHDEsvVZgUMkPKfxGKuHKNi6dUMJXaG+jvuapqjmIXJXEqPBturDqEdcW1B0bW
 U5Wessyfe0O3FnPl4rZLB0Hodf5Wttib7pvPTsfvWjFECgJjLse3e9mxA3getTzFVV4i
 fCMOnQXdMURUn7iicHI+JApcEr4E5+mv51sEFXFBiRlD/+kem2DjPcT/NPIclJfD7dMF
 crzA==
Subject: Re: [PATCH] cpu: Align numbers at decimal points in tables
References: <5bed2a7b-7390-7aed-b91f-b83fb799bddc@gmail.com>
 <20160609163022.GE3758@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5b6b6cbe-3549-10f3-e6f8-c7d1ac2f95a6@gmail.com>
Date: Fri, 10 Jun 2016 07:16:12 +0900
MIME-Version: 1.0
In-Reply-To: <20160609163022.GE3758@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/06/10 1:30, Paul E. McKenney wrote:
> On Fri, Jun 10, 2016 at 12:19:33AM +0900, Akira Yokosawa wrote:
>> >From 5e22d5cb28e5db204c95386ea4427bacc985a7c9 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 10 Jun 2016 00:02:59 +0900
>> Subject: [PATCH] cpu: Align numbers at decimal points in tables
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  cpu/overheads.tex | 56 +++++++++++++++++++++++++++++--------------------------
>>  1 file changed, 30 insertions(+), 26 deletions(-)
>>
>> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
>> index 82853a8..2c89830 100644
>> --- a/cpu/overheads.tex
>> +++ b/cpu/overheads.tex
>> @@ -111,24 +111,26 @@ This simplified sequence is just the beginning of a discipline called
>>
>>  \begin{table}
>>  \centering
>> -\begin{tabular}{l||r|r}
>> -				& 	 	& Ratio \\
>> -	Operation		& Cost (ns) 	& (cost/clock) \\
>> +\begin{tabular}{l||r@{.}l|r@{.}l}
>> +				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
>> +	Operation		& \multicolumn{2}{r}{Cost (ns)}	& \multicolumn{2}{r}{(cost/clock)} \\
>>  	\hline
>>  	\hline
>> -	Clock period		&           0.6	&           1.0 \\
>> +	Clock period		&           0 & 6 &         1 & 0 \\
>>  	\hline
>> -	Best-case CAS		&          37.9	&          63.2 \\
>> +	Best-case CAS		&          37 & 9 &        63 & 2 \\
>>  	\hline
>> -	Best-case lock		&          65.6	&         109.3 \\
>> +	Best-case lock		&          65 & 6 &       109 & 3 \\
>>  	\hline
>> -	Single cache miss	&         139.5	&         232.5 \\
>> +	Single cache miss	&         139 & 5 &       232 & 5 \\
>>  	\hline
>> -	CAS cache miss		&         306.0	&         510.0 \\
>> +	CAS cache miss		&         306 & 0 &       510 & 0 \\
>>  	\hline
>> -	Comms Fabric		&       3,000	&       5,000 \\
>> +	Comms Fabric		& \multicolumn{1}{r@{ }}{3,000} & &
>> +	\multicolumn{1}{r@{ }}{5,000} & \\
>>  	\hline
>> -	Global Comms		& 130,000,000	& 216,000,000 \\
>> +	Global Comms		& \multicolumn{1}{r@{ }}{130,000,000} & &
>> +	\multicolumn{1}{r@{ }}{216,000,000} & \\
>>  \end{tabular}
>>  \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
>>  \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
>> @@ -193,36 +195,38 @@ global agreement.
>>
>>  \begin{table}
>>  \centering
>> -\begin{tabular}{l||r|r}
>> -				& 	 	& Ratio \\
>> -	Operation		& Cost (ns) 	& (cost/clock) \\
>> +\begin{tabular}{l||r@{.}l|r@{.}l}
>> +				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
>> +	Operation		& \multicolumn{2}{r}{Cost (ns)} & \multicolumn{2}{r}{(cost/clock)} \\
>>  	\hline
>>  	\hline
>> -	Clock period		&           0.4	&           1.0 \\
>> +	Clock period		&           0 & 4 &         1 & 0 \\
>>  	\hline
>> -	``Best-case'' CAS	&          12.2	&          33.8 \\
>> +	``Best-case'' CAS	&          12 & 2 &        33 & 8 \\
>>  	\hline
>> -	Best-case lock		&          25.6	&          71.2 \\
>> +	Best-case lock		&          25 & 6 &        71 & 2 \\
>>  	\hline
>> -	Single cache miss	&          12.9	&          35.8 \\
>> +	Single cache miss	&          12 & 9 &        35 & 8 \\
>>  	\hline
>> -	CAS cache miss		&           7.0	&          19.4 \\
>> +	CAS cache miss		&           7 & 0 &        19 & 4 \\
>>  	\hline
>> -	Off-Core		&		&		\\
>> +	Off-Core		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
>>  	\hline
>> -	Single cache miss	&          31.2	&          86.6 \\
>> +	Single cache miss	&          31 & 2 &        86 & 6 \\
>>  	\hline
>> -	CAS cache miss		&          31.2	&          86.5 \\
>> +	CAS cache miss		&          31 & 2 &        86 & 5 \\
>>  	\hline
>> -	Off-Socket		&		&		\\
>> +	Off-Socket		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
>>  	\hline
>> -	Single cache miss	&          92.4	&         256.7 \\
>> +	Single cache miss	&          92 & 4 &       256 & 7 \\
>>  	\hline
>> -	CAS cache miss		&          95.9	&         266.4 \\
>> +	CAS cache miss		&          95 & 9 &       266 & 4 \\
>>  	\hline
>> -	Comms Fabric		&       4,500	&       7,500 \\
>> +	Comms Fabric		& \multicolumn{1}{r@{ }}{4,500}	& &
>> +	\multicolumn{1}{r@{ }}{7,500} & \\
>>  	\hline
>> -	Global Comms		& 195,000,000	& 324,000,000 \\
>> +	Global Comms		& \multicolumn{1}{r@{ }}{195,000,000} & &
>> +	\multicolumn{1}{r@{ }}{324,000,000} & \\
>>  \end{tabular}
>>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> 
> How about the following instead, to get rid of the decimal point as well?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 82853a8e1832..7d33c4800edb 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -126,9 +126,13 @@ This simplified sequence is just the beginning of a discipline called
>  	\hline
>  	CAS cache miss		&         306.0	&         510.0 \\
>  	\hline
> -	Comms Fabric		&       3,000	&       5,000 \\
> +	Comms Fabric		&       3,000\textcolor{white}{.0}
> +						&       5,000\textcolor{white}{.0}
> +								\\
>  	\hline
> -	Global Comms		& 130,000,000	& 216,000,000 \\
> +	Global Comms		& 130,000,000\textcolor{white}{.0}
> +						& 216,000,000\textcolor{white}{.0}
> +								\\
>  \end{tabular}
>  \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
>  \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> diff --git a/perfbook.tex b/perfbook.tex
> index 938c5ee3fd46..5c74adb204af 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -17,6 +17,7 @@
>  \usepackage{graphicx}
>  \usepackage{enumerate}
>  \usepackage{ifthen}
> +\usepackage{xcolor}
>  \usepackage{listings}
>  \lstset{basicstyle=\ttfamily}
>  % \usepackage[strings]{underscore}
> 
> 

Ah, this is way simpler and easy to maintain.

Feel free to add

Reported-by: Akira Yokosawa <akiyks@gmail.com>

Or do you want me to resend a revised patch?

                                               Thanks, Akira

