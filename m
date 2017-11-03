Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TeiyISDJxiThZDT+ZYPxaCgd2LpURaw1Q+n2GCT+ip4=;
 b=DpGkYg28ayfrWG+mjPSPxHs4sJhenq/owaPvUv/nyrNjrASfvEeenmyr7Ngly4Aw9X
 tfdPulelq52GP7+zJND10oqnbIp/AW0OLqDGiXtsnMK4MHFrxnRCXXd6AamEN6XJuwDz
 Bw5UWauNECbW6v39LSJnf70kbUSUJz+Mm8Gjdc5mcpVqpSSXuNk8kXJzzy50e7NMT5rV
 5w5m2RbiFdCy2ofNf4qKx039hEfZMd06wbaSypN1QG+PYZ03sXRexasBKyo3X1CKJojF
 eeFOWRKKabaKik/Qw4zkEY8Jab2ntWVpetVeeCp11XSOEtzjfhJZR09vdWO7RyhWSiwX
 w9dg==
Subject: Re: Incomplete sentence in commit 405f3f465f7f
References: <765342ad-03aa-180f-308f-010a6d503b5d@gmail.com>
 <20171103135948.GI3624@linux.vnet.ibm.com>
 <62297acb-dae2-5096-84f4-44019ba1bd63@gmail.com>
 <20171103154550.GM3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <713ec1c9-1733-9132-f2bb-629f2b1f04dc@gmail.com>
Date: Sat, 4 Nov 2017 07:06:54 +0900
MIME-Version: 1.0
In-Reply-To: <20171103154550.GM3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/03 08:45:50 -0700, Paul E. McKenney wrote:
> On Fri, Nov 03, 2017 at 11:53:00PM +0900, Akira Yokosawa wrote:
>> On 2017/11/03 06:59:48 -0700, Paul E. McKenney wrote:
>>> On Thu, Nov 02, 2017 at 10:32:30PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> In commit 405f3f465f7f ("debugging,formal: Update for increased Linux kernel usage"),
>>>> there is an incomplete hunk of formal/formal.tex
>>>>
>>>> @@ -135,6 +147,7 @@ The larger overarching software construct is of course validated by testing.
>>>>         artifact from the viewpoint of formal verification, it is tiny
>>>>         compared to a great number of projects, including LLVM,
>>>>         \GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
>>>> +       In addition, 
>>>>
>>>>         Although formal verification is finally starting to show some
>>>>         promise, including more-recent L4 verifications involving greater
>>>>
>>>> What was your intention here?
>>>
>>> Those two words do leave quite a bit to the imagination, don't they?
>>
>> Indeed. ;-)
>>
>>>
>>> Good catch, thank you!  Does the patch below help?
>>>
>>> 							Thanx, Paul
>>>
>>> -----------------------------------------------------------------------
>>>
>>> commit 7f417104712459c70117333aa392d680350cae90
>>> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>> Date:   Fri Nov 3 06:58:10 2017 -0700
>>>
>>>     formal: Complete verification-limitations thought in QQ12.33
>>>     
>>>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>>
>>> diff --git a/formal/formal.tex b/formal/formal.tex
>>> index 7c1aeac7d112..2fa410252197 100644
>>> --- a/formal/formal.tex
>>> +++ b/formal/formal.tex
>>> @@ -147,7 +147,9 @@ The larger overarching software construct is of course validated by testing.
>>>  	artifact from the viewpoint of formal verification, it is tiny
>>>  	compared to a great number of projects, including LLVM,
>>>  	\GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
>>> -	In addition, 
>>> +	In addition, this verification did have limits, as the researchers
>>> +	freely admit, to their credit:
>>> +	\url{https://wiki.sel4.systems/FrequentlyAskedQuestions#What_does_seL4.27s_formal_verification_mean.3F}.
>>
>> The next item in the page:
>>
>>     https://wiki.sel4.systems/FrequentlyAskedQuestions#Does_seL4_have_zero_bugs.3F
>>
>> looks more relevant to the "limits", doesn't it?
> 
> Fair enough, please see below.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 715dff95ec40599a67c6835be78a98de2d45c251
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Fri Nov 3 06:58:10 2017 -0700
> 
>     formal: Complete verification-limitations thought in QQ12.33
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/formal/formal.tex b/formal/formal.tex
> index 7c1aeac7d112..219395354106 100644
> --- a/formal/formal.tex
> +++ b/formal/formal.tex
> @@ -147,7 +147,9 @@ The larger overarching software construct is of course validated by testing.
>  	artifact from the viewpoint of formal verification, it is tiny
>  	compared to a great number of projects, including LLVM,
>  	\GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
> -	In addition, 
> +	In addition, this verification did have limits, as the researchers
> +	freely admit, to their credit:
> +	\url{https://wiki.sel4.systems/FrequentlyAskedQuestions#Does_seL4_have_zero_bugs.3F}.
>  
>  	Although formal verification is finally starting to show some
>  	promise, including more-recent L4 verifications involving greater
> 
> 

