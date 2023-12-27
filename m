Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6C24B2A
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR/3/XUK"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3922127a12.3
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703668669; x=1704273469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbGEKCIUGvKSL8BrQp6l5ZoF2YJWnGM5sbEgaQ6BhnQ=;
        b=JR/3/XUKJrC3efT3nIhGTe9O1KSShThCMUlRsx1DbruQ/IfpmyxMJKkDlk0V0DDR9Q
         atZTPjCc3Aoq9zVOlqW4msVQNwgmbmj/yipPWDA97q1/YPaeSGhnAamFG/ajT5+OhIIn
         JllTPt6EN5mRycalhxPovaUE4qoaDW4GGRxpqyJjnF+h6C5oqDTjuFa4gh1yOQpt/6EJ
         cOEBqW9HdLtFUNjSjQS38cnwB6xASYGnGb6Vuh9m5NV6CECvOR3Cp7bpBYdDYcmnDnnV
         n4942Ly89xDEDM6xrszqHZZalRnWekHXxJA+bOzfKzfmjOr+uwJ5k8qVUkLo5NnYZgqM
         XsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703668669; x=1704273469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LbGEKCIUGvKSL8BrQp6l5ZoF2YJWnGM5sbEgaQ6BhnQ=;
        b=femheUrDtVEj3wtA17joIOrvjPiTDMGyQ7+tsmLUtt5oq9Nqf6dTWs1Jwlx8EJZ8pX
         nalBHqwBue/eva8rQTq4Brzm/R+/3FbJwNZaoADSmM3/uwZkA9aSfRfjsZF66KPUr2dd
         VLSa3csLOAeJ1yHarGP3LwqfTp27qR6y0Ln6pVnmT5HseHPK8y+SovDx9d1jhUaMDDQ1
         zmu9lwcXGZpsjWO2yzRvTjHJISYMQNj9nUOSGk9+jZf8Huig8IK+Fqhczhhmizpr9Mbl
         7zIR/xPh8dwjd7s3oIWlVgHp8qgXN2Tts6HZ9OVk8kTLTBRmzpjPN0Va/hJGWy2BO2he
         AXAg==
X-Gm-Message-State: AOJu0YzEfG8QgDK3SyX+HYbfi2lx6Y9+rD+aGq5mgm+EO75nB+FhStKI
	q2ISxUW+BeNyf61pPD47urs=
X-Google-Smtp-Source: AGHT+IHrIHMrsRCS4RLjBmFVv9eG4bonQMJdsVgiLcmpxLDd1OcYLI/Ssyv34uXhJpmTpFm7Ktyrdg==
X-Received: by 2002:a17:902:bb84:b0:1d4:6732:1ab8 with SMTP id m4-20020a170902bb8400b001d467321ab8mr2959992pls.83.1703668669419;
        Wed, 27 Dec 2023 01:17:49 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001ca86a9caccsm11504313pls.228.2023.12.27.01.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 01:17:49 -0800 (PST)
Message-ID: <64dad428-543c-4caf-a2b2-99eb666a2720@gmail.com>
Date: Wed, 27 Dec 2023 18:17:46 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook v3] howto: make ref to git archive explicit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <1703659160-11466-1-git-send-email-zhouzhouyi@gmail.com>
 <33039676-e5dc-4ad1-8d4a-485c9844ed64@gmail.com>
 <CAABZP2z7_v=xt2pxxf3TH4uUaTbO7EV5bvz53OYWOrOJj20ytw@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAABZP2z7_v=xt2pxxf3TH4uUaTbO7EV5bvz53OYWOrOJj20ytw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 27 Dec 2023 16:30:35 +0800, Zhouyi Zhou wrote:
> On Wed, Dec 27, 2023 at 3:50 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>>
>> On Wed, 27 Dec 2023 14:39:20 +0800, zhouzhouyi@gmail.com wrote:
>>> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
>>>
>>> Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
>>> "git archive" is.
>>>
>>> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
>>> ---
>>> Hi Akira
>>>
>>> This is version 3 of my patch "make ref to git archive explicit".
>>>
>>> I fixed the problem of version 1 under your guidance.
>>>
>>> The idea is originally proposed by our Chinese version editor Yunjing Li, but
>>> she was too modest to be a patch author.
>>
>> In that case, a Reported-by: or Suggested-by tag should work, that is
>> if Yunjing Li is OK with her reachable email address exposed.
> Ok, I am try to ask her for her email address.
>>
>>>
>>> I have forget to add "Signed-off-by" in version 2 of my patch, sorry for the inconvenience that I brought.
>>>
>>> Thanks again
>>>
>>> Zhouyi
>>> --
>>>  bib/syncrefs.bib | 8 ++++++++
>>>  howto/howto.tex  | 2 +-
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
>>> index 6ee50e3b..63a7a8bc 100644
>>> --- a/bib/syncrefs.bib
>>> +++ b/bib/syncrefs.bib
>>> @@ -2025,3 +2025,11 @@ Parallel Server on UNIX",
>>>   Month="September",
>>>   Note="Linux Plumbers Conference \url{https://lpc.events/event/16/contributions/1226/}",
>>>  }
>>> +
>>> +@unpublished{PaulmckPerfbookGit,
>>> + author="Paul E. McKenney",
>>> + title="Is Parallel Programming Hard, And, If So, What Can You Do About It? Git Archive",
>>> + year="2023",
>>> + note={\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git}},
>>> + lastchecked="December 27, 2023",
>>> +}
>>> diff --git a/howto/howto.tex b/howto/howto.tex
>>> index 55270cba..e7cd5f3c 100644
>>> --- a/howto/howto.tex
>>> +++ b/howto/howto.tex
>>> @@ -226,7 +226,7 @@ Here are a few possible strategies:
>>>       only a blank sheet of paper.
>>>  \item        If you find the Quick Quizzes distracting but impossible
>>>       to ignore, you can always clone the \LaTeX{} source for
>>> -     this book from the git archive.
>>> +     this book from the git archive~\cite{PaulmckPerfbookGit}.
>>
>> Alternatively, you can put a footnote instead. For example:
>>
>>   See \cref{sec:howto:Whose Book Is This?} for instructions to do this.
>>
>> should also suffice.
> OK, I will do it.
>>
>> Generally speaking, citations are suitable when you want readers
>> to read the referenced document/code and the like.  In this case,
>> presenting just the URL of Git repo won't give readers sufficient
>> info.
>>
>> QQz 1.3 belongs to Section 1.2, while the instructions are in
>> Section 1.5.  So putting a footnote as a (kind-of) "forward reference"
>> looks more reasonable to me.
> But the 'git archive' belongs to the Answer to QQz 3.1 which is in

                                       you mean  QQz 1.3?
				       
> Appendix E, do we still need "forward reference".

That's why I used double quotes and (kind-of), meaning it is not
actually a forward reference.  Only for the first time readers
who read the answer to QQz 1.3 before reading Section 1.5, it works
as a forward reference  :-)

> If the answer is yes,  will  "See \cref{sec:howto:Whose Book Is This?}
> (forward reference) for instructions to do this." be good ?

I don't think you need to say (forward reference) in the footnote.
Just saying:

    See \cref{sec:howto:Whose Book Is This?} for instructions to do this.

should be good enough, I guess.

    Thanks, Akira

>>
>> Can you try this alternative in v4 ?
> Ok, I am very glad to try this.
>>
>> If you are OK with it, please use
>>
>>   Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> OK,
>>
>>     Thanks, Akira
> Thanks, Zhouyi
>>
>>>       You can then run the command \co{make nq}, which will
>>>       produce a \co{perfbook-nq.pdf}.
>>>       This PDF contains unobtrusive boxed tags where the Quick Quizzes
>>

