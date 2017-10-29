Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ctlqmlxeDjIv0l/d6ilcdnH7iOHUYYMD1I00+Tq8lOg=;
 b=PCnnaacE8h4PTi8Wu677XGPLfR4+9S8x1U+SCdXCD6q1DcM5THavO4YsaSPSrf37iV
 /ufAOiiHUlzZbyKjZtB6aGS0j69OTbDCi46UdRJoobMPwUQtG2+h/5R2E6OH6pwv9HW5
 936pDw7x0HXfE+XVynZvImbg7cfoiW2FB/sGm7RSc7/YZO5W1s1qBIpGjQotnBFpSMbr
 ZTV5Fdlsg3vbaRFXJBTvh1E7AI81TzMIy7BhC3U1ssteO7fO9KBJAaGApJQ1NowRr216
 QubYpf+izDiLbQiGv+UQVp0HRajRQ9pd1sKBWFpkjajF/TH0qBxXMhJyazh4TFMq2VSJ
 HGtw==
Subject: Re: [PATCH] typo at Chp 7.
References: <20171027092317.GA8509@HP> <20171027093317.GB8509@HP>
 <a15a6a6b-010b-6284-41fb-23ab36a39aa5@gmail.com>
 <20171027232408.GT3659@linux.vnet.ibm.com> <20171028133712.GD5742@HP>
 <20171028131703.GW3659@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <46940108-3ce9-9f6f-fa63-e73953639804@gmail.com>
Date: Sun, 29 Oct 2017 08:15:46 +0800
MIME-Version: 1.0
In-Reply-To: <20171028131703.GW3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 10/28/2017 09:17 PM, Paul E. McKenney wrote:
> On Sat, Oct 28, 2017 at 09:37:20PM +0800, Yubin Ruan wrote:
>> On Fri, Oct 27, 2017 at 04:24:08PM -0700, Paul E. McKenney wrote:
>>> On Sat, Oct 28, 2017 at 12:18:47AM +0900, Akira Yokosawa wrote:
>>>> On 2017/10/27 18:33, Yubin Ruan wrote:
>>>>> And here are some more modification to some wording in chapter 7, but I am not
>>>>> sure whether you like it or not.
>>>>>
>>>>> Anyway, chapter 7 makes me feel good ;-) It makes me know that home-brewing a
>>>>> lock primitives with atomic instructions(which is what I was doing) is
>>>>> something that is possible and used in production.
>>>>>
>>>>> Thanks,
>>>>> Yubin
>>>>>
>>>>> diff --git a/locking/locking.tex b/locking/locking.tex
>>>>> index 14db27d..a9f46f1 100644
>>>>> --- a/locking/locking.tex
>>>>> +++ b/locking/locking.tex
>>>>> @@ -2166,8 +2166,8 @@ Signal-handler deadlocks can be explicitly avoided as follows:
>>>>>  	of a signal handler.
>>>>>  \item	If the application invokes the library function
>>>>>  	while holding a lock acquired within a given signal
>>>>> -	handler, then that signal must be blocked every time that the
>>>>> -	library function is called outside of a signal handler.
>>>>> +	handler, then that signal must be blocked every time that lock
>>>>> +    is to be acquired outside of a signal handler.
>>>>
>>>> The talking point here is library function and signal handler. So something like:
>>>>
>>>> +	handler, then that signal must be blocked every time that one
>>>> +	of related library functions is called outside of the signal handler.
>>>>
>>>> Thoughts?
>>>
>>> I believe that the major problem is that I didn't really specify the
>>> situation and constraints.  How about the following?
>>>
>>> 							Thanx, Paul
>>>
>>> -----------------------------------------------------------------------
>>>
>>> commit 85025eaceff8cf10c9b674ba70d33dbd012e27ce
>>> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>> Date:   Fri Oct 27 16:21:33 2017 -0700
>>>
>>>     locking: Clarify explicit avoidance of signal-handler deadlocks
>>>     
>>>     Reported-by: Yubin Ruan <ablacktshirt@gmail.com>
>>>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>>
>>> diff --git a/locking/locking.tex b/locking/locking.tex
>>> index 14db27d1148b..025320b294ed 100644
>>> --- a/locking/locking.tex
>>> +++ b/locking/locking.tex
>>> @@ -2157,7 +2157,17 @@ locks, the strategies in the next section may prove helpful.
>>>  \subsubsection{Explicitly Avoid Signal-Handler Deadlocks}
>>>  \label{sec:locking:Explicitly Avoid Signal-Handler Deadlocks}
>>>  
>>> -Signal-handler deadlocks can be explicitly avoided as follows:
>>> +Suppose that a given library function is known to acquire locks,
>>> +but does not block signals.
>>> +Suppose further that it is necessary to invoke that function both from
>>> +within and outside of a signal handler, and that it is not permissible
>>> +to modify this library function.
>>> +Of course, if no special action is taken, then if a signal arrives
>>> +while that library function is holding its lock, deadlock can occur
>>> +when the signal handler invokes that same library function,
>>> +which in turn attempts to re-acquire that same lock.
>>> +
>>> +Such deadlocks can be avoided as follows:
>>>  
>>>  \begin{enumerate}
>>>  \item	If the application invokes the library function from
>>
>> These all look good to me. Thank you Paul.
> 
> Very good, I will push it out.  May I have your Acked-by?
> (As in "Acked-by: Yubin Ruan <ablacktshirt@gmail.com>".)
> 
> (If I don't hear otherwise in about 12 hours, I will just push it
> out as is.)


Acked-by: Yubin Ruan <ablacktshirt@gmail.com>

Yubin

