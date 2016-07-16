Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rRvsgCJJqdxrWFLxlF+QNTNb4QXPd3Hgg8SvqWnjy7k=;
 b=iJFthsuX8U2pBB2WOYwWCWXaPvf+6aY3fZ2VfW3UkuS50jUe46Pru7Fnxdf3XuHOAu
 UDrpGVfjpXVhlqLdCjuerozXtWS8/d6KUItX6OqjJCb1v7rogzObSuKY3RaIgpl2jBP1
 iOQROJzzuhec+zXISqxPAbi6HD2FGU5emt/Ng6mYKIu7JJpPccH1SZodnwgCGhF8r1CP
 yzchvSOXzBRqSEyCa8n3o6077ZP2KbYbtM1DElvJHJ7QHsipzGwl4g0li5j4NW7P1ho/
 qOabfmpX0eKAzCmUX5JnUNrmAR0owtRjSi9MBZIu7NtssrY3zYN5QMNDYPtFuLby+vp2
 WP6g==
From: SeongJae Park <sj38.park@gmail.com>
Date: Sun, 17 Jul 2016 08:40:54 +0900 (KST)
Subject: Re: [PATCH 3/4] defer/whichtochoose: Trim a sentence
In-Reply-To: <e8aae464-9c9c-411b-597b-50344d81612b@gmail.com>
Message-ID: <alpine.DEB.2.10.1607170830180.17560@hxeon>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
 <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
 <e8aae464-9c9c-411b-597b-50344d81612b@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On Sun, 17 Jul 2016, Akira Yokosawa wrote:

> Hi,
>
> On 2016/07/16 16:58:49 +0900, SeongJae Park wrote:
>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>> ---
>> defer/whichtochoose.tex | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
>> index 648cdc8..884de9d 100644
>> --- a/defer/whichtochoose.tex
>> +++ b/defer/whichtochoose.tex
>> @@ -135,7 +135,7 @@ capable of unconditionally acquiring references.
>> The entry for sequence locks is ``N/A'' because, again, sequence locks
>> detect updates rather than acquiring references.
>> Reference counting and hazard pointers require that traversals be
>> -restarted from the beginning should a given acquisition fail because
>> +restarted from the beginning if a given acquisition fail because
>
> I can't get the point of this change. Original sentence seems quite natural
> for me.

Well, I thought it would be easier to understand the meaning for poor
English speakers like me, though judging is Paul's right.  So, please feel
free to discard this patch if you think it's unnecessary, Paul.  BTW, I
think I found one trivial grammar mistake here:
`s/a given acquisition fail/a given acquisition fails/`.

>
>> the currrent object might be removed and all of its
>> possible successsors might be not only be removed, but also freed.
>> For example, when using reference counting or hazard pointers to
>> 
>
> However, there are typos here. We need to modify as follows.
>
> -the currrent object might be removed and all of its
> -possible successsors might be not only be removed, but also freed.
> +the current object might be removed and all of its
> +possible successors might be not only be removed, but also freed.

Good catch! 8D  It looks like the Many-eyeball law is working well. ;)


Thanks,
SeongJae Park

>
> I'm sorry but I didn't compose in a patch format.
> Paul, if you want a proper patch, feel free to ask me.
> I'd rather refrain from sending patches that touch Chapter 9, which I assume
> is being intensively rewritten right now.
>
>                                                Thanks, Akira

