Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XGJBMPvLEa/We6/ARwW/RNqPqpzJRnsPpzl/0xHX0w=;
 b=V4qP84cVxZmTW7F2qpMJS12CAaD6E6QpdzwMeXMWaioC16oBb/JdXBhnk3QNzXB0HQ
 iX/uiLSYTlO0oLUljwTNT9P8zvnlb17usT8RlPiPeoIqi6UXvpXi8OiI1vuIDzWYiENT
 J9lXiN6/842HYDIlBEgy2VC3R0X85fdltUSNnM6C301qI3o1gNA8nvepnPoVZKdfpS8R
 /t4XTLQ3+iUyR1asuhpKjj1jgFik9WIcJox7BM+ToM/nCheOSTp0w0aOoIntR5ge16gV
 I2MZQKEQuFGNM6sgePvE6imUNeYzUdoEu83+BXudOGS+Hj8RKLP6IKj08+YDnV9jWZcf
 RLYw==
Subject: Re: [NOT A PATCH] Question on regression by bug fixes
References: <8c6af34c-7cc5-492d-14c6-d6bc990da24b@gmail.com>
 <20171102235344.GF3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b760802f-7736-323f-c4c4-200989a0e1fc@gmail.com>
Date: Fri, 3 Nov 2017 09:07:43 +0900
MIME-Version: 1.0
In-Reply-To: <20171102235344.GF3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/02 16:53:44 -0700, Paul E. McKenney wrote:
> On Thu, Nov 02, 2017 at 11:19:45PM +0900, Akira Yokosawa wrote:
>> Hi Paul
>>
>> I couldn't follow the reasoning around the following _artificial_ hunk.
>>
>> diff --git a/formal/regression.tex b/formal/regression.tex
>> index 29cb787..9831b9d 100644
>> --- a/formal/regression.tex
>> +++ b/formal/regression.tex
>> @@ -387,6 +387,7 @@ To see this, keep in mind that on average, every six fixes introduces
>>  a bug.
>>  Therefore, fixing the 24 bugs, which had a combine mean time to failure
>>  of about 40,000 years, will introduce three more bugs.
>> +???
>>  These three bugs most likely fail more often than once per 13,000 years,
>>  so the reliability of the software has decreased.
>>
>> Where did the "once per 13,000 years" come from?
>> 13,000 was derived from 40,000/3?
>>
>> But in this argument, original 24 bugs are fixed, and 3 new bugs are introduced.
>> We have no idea what failure rate the new bugs would have, don't we???
>>
>> What am I missing?
> 
> You are not missing much, but it looks like I was thinking backwards.
> For one thing, I was using an outdated bug-injection rate, more recent
> figures are 7%.  I updated this, (hopefully) fixed and clarified the
> reasoning, and added a citation for the 7%.  How does the patch below
> look?

Nice clarification! Now the reasoning is easy to follow.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

      Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit b1efdff66eb050317232dd36bd4b1385ed24524d
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Thu Nov 2 16:50:44 2017 -0700
> 
>     formal: Update bug-injection rate and clarify reasoning
>     
>     New data says 7% instead of 1-of-6, and the math was backwards.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/formal/regression.tex b/formal/regression.tex
> index 29cb78709f76..479ae020b518 100644
> --- a/formal/regression.tex
> +++ b/formal/regression.tex
> @@ -374,28 +374,68 @@ type of validation effort.
>  Clearly, false positives are to be avoided.
>  But even in the absense of false postives, there are bugs and there are bugs.
>  
> -For example, suppose that a software artifact had exactly 24 remaining
> +For example, suppose that a software artifact had exactly 100 remaining
>  bugs, each of which manifested on average once every million years
>  of runtime.
>  Suppose further that an omniscient formal-verification tool located
> -all 24 bugs, which the developers duly fixed.
> +all 100 bugs, which the developers duly fixed.
>  What happens to the reliability of this software artifact?
>  
> -The reliability \emph{decreases}.
> +The perhaps surprising answer is that the reliability \emph{decreases}.
>  
> -To see this, keep in mind that on average, every six fixes introduces
> -a bug.
> -Therefore, fixing the 24 bugs, which had a combine mean time to failure
> -of about 40,000 years, will introduce three more bugs.
> -These three bugs most likely fail more often than once per 13,000 years,
> -so the reliability of the software has decreased.
> +To see this, keep in mind that historical experience indicates that
> +about 7\% of fixes introduce a new bug~\cite{RexBlack2012SQA}.
> +Therefore, fixing the 100 bugs, which had a combined mean time to failure
> +(MTBF) of about 10,000 years, will introduce seven more bugs.
> +Historical statistics indicate that each new bug will have an MTBF
> +much less than 70,000 years.
> +This in turn suggests that the combined MTBF of these seven new bugs
> +will most likely be much less than 10,000 years, which in turn means
> +that the well-intentioned fixing of the original 100 bugs actually
> +decreased the reliability of the overall software.
> +
> +\QuickQuiz{}
> +	How do we know that the MTBFs of known bugs is a good estimate
> +	of the MTBFs of bugs that have not yet been located?
> +\QuickQuizAnswer{
> +	We don't, but it does not matter.
> +
> +	To see this, note that the 7\% figure only applies to injected
> +	bugs that were subsequently located: It necessarily ignores
> +	any injected bugs that were never found.
> +	Therefore, the MTBF statistics of known bugs is likely to be
> +	a good approximation of that of the injected bugs that are
> +	subsequently located.
> +
> +	A key point in this whole section is that we should be more
> +	concerned about bugs that inconvenience users than about
> +	other bugs that never actually manifest.
> +	This of course is \emph{not} to say that we should completely
> +	ignore bugs that have not yet inconvenienced users, just that
> +	we should properly prioritize our efforts so as to fix the
> +	most important and urgent bugs first.
> +} \QuickQuizEnd
> +
> +\QuickQuiz{}
> +	But the formal-verification tools should immediately find all the
> +	bugs introduced by the fixes, so why is this a problem?
> +\QuickQuizAnswer{
> +	It is a problem because real-world formal-verification tools
> +	(as opposed to those that exist only in the imaginations of
> +	the more vociferous proponents of formal verification) are
> +	not omniscient, and thus are only able to locate certain types
> +	of bugs.
> +	For but one example, formal-verification tools are unlikely to
> +	spot a bug corresponding to an omitted assertion or, equivalently,
> +	a bug corresponding to an omitted portion of the specification.
> +} \QuickQuizEnd
>  
>  Worse yet, imagine another software artifact with one bug that fails
> -once every day on average and 24 more that fail every million years
> +once every day on average and 99 more that fail every million years
>  each.
> -Suppose that a formal-verification tool located the 24 million-year
> +Suppose that a formal-verification tool located the 99 million-year
>  bugs, but failed to find the one-day bug.
> -Fixing the 24 bugs located will take time and effort, likely slightly
> +Fixing the 99 bugs located will take time and effort, likely slightly
>  decrease reliability, and do nothing at all about the pressing
>  each-day failure that is likely causing much embarrassment and perhaps
>  much worse besides.
> 
> 

