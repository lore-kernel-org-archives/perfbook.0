Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=R16iN3MY6cR3Qb2BYsXWTj+2zJD5A8Pi0c+JMCMb/fU=;
 b=PG1kon/SRqe3cb/JGjKXRi5wsRBqszinZYPObs4Oi4HN5pDeANkPS93dKmJcRUUlHG
 0oYydIHhpTrQpz43cSgSL2wlUroCeMsL9TUHjr0G/0Hw8YiLZTzag4/GyM2qlqPHyOlO
 lfdxTx3/db95H+R9dR0K6IAp1ycZ2goJ6o+Hrw0QZ5JI24YpekJ+4WJNPz2lqArupe+A
 R2gqpLNm1q+FMiYOVPW7K3f6wyGA9ThB3zIe4QeT5vX/BTNMN99aw4aKvPfJEuDhmXyv
 0PPvd0jPuH0v9/xtmM9viNtQ3A9gI0slYopK3gI78Mjpye01aKT+R4fuo5623yi78WiR
 nm8Q==
Subject: Re: [PATCH] utilities/autodate.sh: too many \s
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
 <20170118170032.GA3021@linux-uys3>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <44b348bb-d22d-0aca-7ae2-f21d7a7a6ec6@gmail.com>
Date: Thu, 19 Jan 2017 07:15:00 +0900
MIME-Version: 1.0
In-Reply-To: <20170118170032.GA3021@linux-uys3>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, akiyks@gmail.com
List-ID: <perfbook.vger.kernel.org>

On 2017/01/18 12:00:32 -0500, Trevor Woerner wrote:
> Hi Akira,
> 
> On Tue 2017-01-17 @ 08:30:57 PM, Akira Yokosawa wrote:
>> On 2017/01/16 18:41:25 -0500, Trevor Woerner wrote:
>>> Remove extraneous \ which causes build to fail:
>> I'm submitting a patch of the script with portability in mind.
>> Can you try it?
> 
> Yes, this patch works for me. Thanks for the update, sorry for the delay.

Thanks for testing!
Can I get your Tested-by:?

                                         Thanks, Akira

