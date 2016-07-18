Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=h99zuAU03JFMPELhKp+FcUaceAO9106rOLQ5xgm2crk=;
 b=mPmKhuZY4sIltuUwcc6N2ngkONZenjf/E2xDityPwIkcFqv5Jq1OoAZ5PQzdvuediP
 lX/OI9gXW9KPpbS2+VDnTs5v0d6Y7MieZRUNagqxnJaVtQPTzvEXnhwMqz7yx8EMbf2m
 86+fYpKZ7El8NWphj0jd4nL7weyUgcdynhn0THs/2wDcwIXZ3Lki0nCM4D8EIGl3e7+r
 zUA7ElaRM2m1YsdXvypLi+dOvEhcauqh2OZQVON62V+KrltuBdcKivB3ZOWAuKaFFdgv
 T5He6n9dYRRLTR/OIX0Vs7jwBSD3hz4fteHmFQgfIcWb7iZNgb86hPI89nRiv5+9HxMM
 6osg==
Subject: Re: [PATCH] qqz: Modify back link target at end of QQA to the end of
 QQ
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
 <51abb1c5-e843-ef5c-0c7f-121281ba2631@gmail.com>
 <20160718152525.GK7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <db41c385-84b4-78ea-8c08-faea987f8175@gmail.com>
Date: Tue, 19 Jul 2016 06:48:05 +0900
MIME-Version: 1.0
In-Reply-To: <20160718152525.GK7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/19 0:25, Paul E. McKenney wrote:
> On Mon, Jul 18, 2016 at 09:01:51AM +0900, Akira Yokosawa wrote:
>> From e51d65d2b5e10dcf4bd4f5970010c0cded292f0e Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 18 Jul 2016 08:41:12 +0900
>> Subject: [PATCH] qqz: Modify back link target at end of QQA to the end of QQ
>>
>> This commit modifies the target of back link at the end of QQA
>> (white box) to the end of corresponding QQ in the main text.
>> This change enables you to easily reach the text following a
>> (possibly long) QQ by clicking a white box at the end of the QQA.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Hmmm...  This also does not apply.  Could you please apply it at your
> end from email and/or compare it to your original?  I am beginning
> to suspect that the patch got corrupted in transit.

It turns out that the config setting of my Thunderbird was modified
unknowingly.
"mailnews.send_plaintext_flowed" should be "false," but it returned to its
default "true."

After I modified the setting, I tested sending the patch to myself and
it applies.
So I'm sending it to you and the list.  Sorry to have bothered you.

                                                 Thanks, Akira
>
> 							Thnax, Paul
> 

