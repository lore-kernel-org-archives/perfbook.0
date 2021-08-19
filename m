Return-Path: <SRS0=KBDY=NK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KoHZeUL2gkGIAJF2xQkxHfZUfvt0esbJn3zKMFVotVw=;
        b=PmAcA852FjzxuvE8iutLd1NsHc+fGEcvdrhwCpXcZvVJtsNr1AeFARmgvlkffgSBOC
         Qco7/wtJ9UPEmqiV835GCjsfj7su77tz+nqfK+U9PoonpO62w4jAciZrPpHzLV4eDKEg
         GqkjyKFoDv3JjGIt1fX5WZyGd4r9JyhsGi9/N24RGD9XqI6Zk8qOUc4kpScf+q6qlfzB
         SQdhA2eSXLDBo7d8rHX+fFGvDsMw2BcA9jfZsLvnyvYXLU+11CjP3fig2WNlPjfHVVeX
         jQEL6HoyT58cT5n5sWf+6+3lrzUaLPNJblaqeo/cJq2qcGw3ottleWkCPPZ60bBLjFOy
         9Qtg==
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
 <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6751500e-62ed-3bcb-fe9f-290a826ed8da@gmail.com>
Date: Fri, 20 Aug 2021 08:43:13 +0900
MIME-Version: 1.0
In-Reply-To: <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com
List-ID: <perfbook.vger.kernel.org>

On Thu, 19 Aug 2021 10:29:40 -0700, Paul E. McKenney wrote:
> On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
>> Hello Zhouyi,
>>
>> On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
>>> Hi Paul,
>>>
>>> I think there is a little grammer mistake in answer to quick quiz 10.8,
>>> I am not so sure because my English is not so well ;-)
>>>
>>> Thanks
>>> Zhouyi
>>>
>>> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>>> ---
>>>  datastruct/datastruct.tex | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
>>> index adb102d..68341f2 100644
>>> --- a/datastruct/datastruct.tex
>>> +++ b/datastruct/datastruct.tex
>>> @@ -963,1 +963,1 @@ not recommended for production use.
>>>  	In theory, it isn't any safer, and a useful exercise would be
>>> 	to run these programs on larger systems.
>>>  	In practice, there are a lot more systems with more than 28~CPUs
>>> -	than there are systems with more than 448 CPUs.
>>
>> This can be parsed as follows:
>>
>>     In practice, there are a lot more X than there are Y.
>>
>> , where
>>
>>     X: systems with more than 28~CPUs
>>     Y: systems with more than 448 CPUs
>>
>> So there is no grammatical error here.
>> Three uses of "than" in a sentence might be confusing, though.
>>
>> Paul might have an idea of a less-confusing sentence.
> 
> Three "than"s in one sentence is a bit excessive, now that you guys
> mention it.
> 
> How about this?
> 
> 	In practice, there are a lot more 28-CPU systems than there are
> 	448-CPU systems.
> 
> I do not believe that the "more than"s are really adding much here.

Well, the question part reads:

> The dangers of extrapolating from 28 CPUs to 448 CPUs was made quite
> clear in Section 10.2.3. But why should extrapolating up from 448 CPUs be
> any safer?

So, the point is "extrapolating up from 448 CPUs".
Hence you used "more than"s in the answer, didn't you?

        Thanks, Akira

> 
> Thoughts?
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira 
>>
>>> +	are systems with more than 448 CPUs.
>>>  	In addition, other testing has shown that RCU read-side primitives
>>>  	offer consistent performance and scalability up to at least 1024 CPUs.
>>>  }\QuickQuizEnd
>>>
