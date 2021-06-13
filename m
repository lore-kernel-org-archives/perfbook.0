Return-Path: <SRS0=17YS=LH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CZ/3rIprGiJ0JaR9bfqZPBSWOPjjGs76rIc3oKRQHj4=;
        b=mfhAmR/OiKNzGRsReSvQn5CB6kIWaIQpB+tr83lOkhqp51rPlaYgEPy8vG85TDJAS8
         cUrYGCjPWIw/O+0567MgD8Gs2qP7Q2dJJie+stD6T9hId2/VEEjv4soXukHD2h1a2nV3
         DDTZuLrMGXMdEeXDr+vbO9GEfvhJS+x11k9lJYvD8ADoftxObrgZh5jf6sRtJ9bVfwvE
         pzsQaY7lvLbnbARRufwIUs6kpFfJ+PWZnwPCMNp6b4icfqaM3KmlSVIJp45juyme1g3a
         jwkV6eE++cC7zZ26oy91b1mpbP+VPVAkUWGh7lavFXApxUhJLhN1A5DMJvJyJU2eFO1O
         xJWQ==
Subject: Re: [PATCH v2 -perfbook] howto, intro, cpu: Break and capitalize
 after colon
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
 <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
 <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
 <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
 <b94fd29f-66a5-b4c8-cca5-6f81a75f20a7@gmail.com>
 <e6b2532d-3059-d6e4-5ae1-15feb70067f6@gmail.com>
 <20210613155725.GM4397@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e7bd8e4b-c6ba-5eeb-6d6f-b56d29c75ff1@gmail.com>
Date: Mon, 14 Jun 2021 07:58:59 +0900
MIME-Version: 1.0
In-Reply-To: <20210613155725.GM4397@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 13 Jun 2021 08:57:25 -0700, Paul E. McKenney wrote:
> On Sat, Jun 12, 2021 at 03:14:52PM +0900, Akira Yokosawa wrote:
>> Fix violations detected by the check scripts at hand.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I have pulled this in, thank you very much!
> 
> There is one mistake I made in my previous reply, and I have fixed
> this.  Please see below.
> 
[...]
>> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
>> index 92f04f16..68c6dd5f 100644
>> --- a/cpu/hwfreelunch.tex
>> +++ b/cpu/hwfreelunch.tex
>> @@ -167,8 +167,9 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>>  \label{sec:cpu:Novel Materials and Processes}
>>  
>>  Stephen Hawking is said to have claimed that semiconductor manufacturers
>> -have but two fundamental problems: (1) the finite speed of light and
>> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
>> +have but two fundamental problems:
>> +(1)~The finite speed of light and
>> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
> 
> I should have capitalized the "the" in this last line.  I did so before
> applying your patch.

Well, I'm afraid this pattern is well beyond the capability of the dumb
perl script.  (Hint: It only looks at the next input line of colon.)

Anyway, I'll update the other chapters in the same manner.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>  It is possible that semiconductor manufacturers are approaching these
>>  limits, but there are nevertheless a few avenues of research and
>>  development focused on working around these fundamental limits.
[...]
