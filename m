Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j43O1DZjZXJOIps6rDF2jLTGJP1pcG8aXO/DBaZlw4U=;
 b=J571Oo4FF0kQuF8AcHVDMA7/1p55zNHEe7PdB9UZ2K9GH+XZLUe8bc6NsnJNto6ZSy
 JCMS5YpgXnBn2ukQNuQKRrXlWU9APdsxX+aj4if50AG8zAvSm7BX47NWBqmdhyfxDtOK
 KQVXaLdo60pFK/shpfbTpFDyL+9ge5Y/bVcxToNMb4HL4xxEu+djeh+GRuRE0PNlMFbM
 kZ98mlkLpVpkm/y63RLwRWn1C/XBHzFzEshHrjXKBSLildZjLcJP+2NCMJaBtyma6Rsx
 F2/L2oKCa1dWrFBPM8co10OIVNTGGBang7h4brKzvmBgUcx8uyXZcvneQPdT1DUvZdrC
 XtzA==
Subject: Re: Incomplete sentence in commit 405f3f465f7f
References: <765342ad-03aa-180f-308f-010a6d503b5d@gmail.com>
 <20171103135948.GI3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <62297acb-dae2-5096-84f4-44019ba1bd63@gmail.com>
Date: Fri, 3 Nov 2017 23:53:00 +0900
MIME-Version: 1.0
In-Reply-To: <20171103135948.GI3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/03 06:59:48 -0700, Paul E. McKenney wrote:
> On Thu, Nov 02, 2017 at 10:32:30PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> In commit 405f3f465f7f ("debugging,formal: Update for increased Linux kernel usage"),
>> there is an incomplete hunk of formal/formal.tex
>>
>> @@ -135,6 +147,7 @@ The larger overarching software construct is of course validated by testing.
>>         artifact from the viewpoint of formal verification, it is tiny
>>         compared to a great number of projects, including LLVM,
>>         \GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
>> +       In addition, 
>>
>>         Although formal verification is finally starting to show some
>>         promise, including more-recent L4 verifications involving greater
>>
>> What was your intention here?
> 
> Those two words do leave quite a bit to the imagination, don't they?

Indeed. ;-)

> 
> Good catch, thank you!  Does the patch below help?
> 
> 							Thanx, Paul
> 
> -----------------------------------------------------------------------
> 
> commit 7f417104712459c70117333aa392d680350cae90
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Fri Nov 3 06:58:10 2017 -0700
> 
>     formal: Complete verification-limitations thought in QQ12.33
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/formal/formal.tex b/formal/formal.tex
> index 7c1aeac7d112..2fa410252197 100644
> --- a/formal/formal.tex
> +++ b/formal/formal.tex
> @@ -147,7 +147,9 @@ The larger overarching software construct is of course validated by testing.
>  	artifact from the viewpoint of formal verification, it is tiny
>  	compared to a great number of projects, including LLVM,
>  	\GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
> -	In addition, 
> +	In addition, this verification did have limits, as the researchers
> +	freely admit, to their credit:
> +	\url{https://wiki.sel4.systems/FrequentlyAskedQuestions#What_does_seL4.27s_formal_verification_mean.3F}.

The next item in the page:

    https://wiki.sel4.systems/FrequentlyAskedQuestions#Does_seL4_have_zero_bugs.3F

looks more relevant to the "limits", doesn't it?

        Thanks, Akira

>  
>  	Although formal verification is finally starting to show some
>  	promise, including more-recent L4 verifications involving greater
> 
> 

