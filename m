Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iVSbWxEMyi5Fo12kw6XSzVxH99uHW9UO9SQgPUlI/2s=;
 b=TXCo79CPAEBWIVatDUgGAVnVV3PjU1Rh6pLbvo0t7XsM+sKLasqOO5zMQM4EQCD1b0
 uhMDzzfRn9DFfF6wBf4MnoXgdyPQTbG20leVzEnWFOpqAd18x6ocK7uC9advigjN4Pya
 9KqepYhdb4in2N+3mfluAcS8BJukAxyJA6wDpo6LsjKcXc9YFOMHOCX9GxiBgr4n+mx/
 bLZvgr/SoSexC5OBJmEOOMthQ0W2QQ21Ybg+Y8eirXQoEGsMOKRyNtATi6NbkchHQNWq
 7xCD+cVgGi8Kt7h/ES9WNBmz1IeLAbSBmrIkRLIXpHY0KFkrN5fydCHGqKFeJ6p2gcAh
 yiJQ==
Subject: Re: [PATCH] memorder: Add one solution for one snippet
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
 <20170917215508.GD3521@linux.vnet.ibm.com>
 <fb1ab164-36a7-1ed7-4eea-5668f5ada155@gmail.com>
 <20171030181423.GA3659@linux.vnet.ibm.com>
 <b067fb63-43b7-a8a4-7bdd-3cd79b839d5c@gmail.com>
 <70204d71-e19e-4bb6-8064-984550c38456@gmail.com>
 <20171031035009.GG3659@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <b2040c95-b80a-51c2-932e-42e9bdb0191d@gmail.com>
Date: Tue, 31 Oct 2017 13:04:51 +0800
MIME-Version: 1.0
In-Reply-To: <20171031035009.GG3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul,

On 10/31/2017 11:50 AM, Paul E. McKenney wrote:
> On Tue, Oct 31, 2017 at 11:14:47AM +0800, Yubin Ruan wrote:
>> >From 256adc5ccd239288c3f38cd193072d6666ab1e82 Mon Sep 17 00:00:00 2001
>> From: Yubin Ruan <ablacktshirt@gmail.com>
>> Date: Tue, 31 Oct 2017 11:12:03 +0800
>> Subject: [PATCH] memorder: Add one solution for one snippet
>>
>> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
>> ---
>>  memorder/memorder.tex | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index f8886b4..a1c96df 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -3055,6 +3055,8 @@ surprise to \co{do_something()}.\footnote{
>>  	Tracking down the bug consumed a holiday weekend not just
>>  	for your editor, but also for several of his colleagues.
>>  	In short, this is not a new problem.}
>> +In this case, \co{tmp} should be declared as \co{volatile} to prevent
>> +the transformation by the compiler.
>>
>>  Compilers can also fuse stores.
>>  The most infamous example is probably the progress-bar example
> 
> Declaring tmp as volatile could in some sense solve the problem, but at
> the expense of preventing the compiler from caching tmp in a register.
> It is better to use READ_ONCE() on the initial read from p, or failing
> that, to declare p (not tmp) volatile.
> 
> 							Thanx, Paul

Acked-by: Yubin Ruan <ablacktshirt@gmail.com>

> ------------------------------------------------------------------------
> 
> commit d1f08db32120f079da699c9deebde22af96a202a
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Mon Oct 30 20:44:33 2017 -0700
> 
>     memorder: Show how to use READ_ONCE() to prevent load replication
>     
>     Reported-by: Yubin Ruan <ablacktshirt@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index f8886b42468c..a3b8f7c86946 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3055,6 +3055,21 @@ surprise to \co{do_something()}.\footnote{
>  	Tracking down the bug consumed a holiday weekend not just
>  	for your editor, but also for several of his colleagues.
>  	In short, this is not a new problem.}
> +To prevent the compiler from replicating the load, use \co{READ_ONCE()},
> +for example as follows:
> +
> +\vspace{5pt}
> +\begin{minipage}[t]{\columnwidth}
> +\scriptsize
> +\begin{verbatim}
> +  1 tmp = READ_ONCE(p);
> +  2 if (tmp != NULL && tmp <= q)
> +  3   do_something(tmp);
> +\end{verbatim}
> +\end{minipage}
> +\vspace{5pt}
> +
> +Alternatively, the variable \co{p} could be declared \co{volatile}.
>  
>  Compilers can also fuse stores.
>  The most infamous example is probably the progress-bar example
> 

