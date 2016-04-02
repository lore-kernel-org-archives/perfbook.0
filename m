Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33221 "EHLO
 mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751359AbcDBDGu (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 1
 Apr 2016 23:06:50 -0400
Received: by mail-oi0-f68.google.com with SMTP id v67so9537744oie.0 for
 <perfbook@vger.kernel.org>; Fri, 01 Apr 2016 20:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc;        bh=78Hwt+YVdG5RHEzK9K9sOV3wQtiqbWUlfEyPIH05I5w=;
 b=j7ixOGOzCiP4ruG6W6FVavls47w99A4KuihJ4HA9uNde18ji6FjBHSbjFjcx8P1bxU
 Fgwu/wS8jEZOOR77Gbtvay74o25rDKiLnTt2lilVLHL3x2ce+p965VBjbOOHLx27N6v0
 0rqxm0HKg1cZYx5/RCoSO0/oTtWE6NYQqG54KDwsTra3TdhMEGGPN1bf8FoMacio/Yjo
 gLf8yO4H43/7WD2E4vwf7HE2XzNEhN26r84FiLANIVvQ6WnaCcCX6p5B2C/NGmRcCZME
 7demW3tiXXbIywPxknJAztUPLWFU9omet4pif6boIgS6AfWFs/ko3/+3t3m/8kefmnqa
 ldnw==
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1604021149350.22948@hxeon>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-5-git-send-email-sj38.park@gmail.com>
 <CADj5ksQFv7pCx1WLdWRtNQwff7LBg+BspASL5dhbJAJVC2qeUQ@mail.gmail.com>
 <alpine.DEB.2.10.1604021149350.22948@hxeon>
Date: Sat, 2 Apr 2016 12:06:49 +0900
Message-ID: 
 <CADj5ksTnSn0R+1RN11Y3jAF7+P9X549nvV-ze8uvSF=eY_aWVA@mail.gmail.com>
Subject: Re: [PATCH 4/6] advsync: fix wrong code example
From: Yokosawa Akira <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

If you would like, I don't mind you adding

Suggested-by: Akira Yokosawa <akiysw@gmail.com>

to the commit log.

-- 
 Akira Yokosawa <akiysw@gmail.com>

2016-04-02 11:52 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
> Hi,
>
>
> On Sat, 2 Apr 2016, Yokosawa Akira wrote:
>
>> Sorry, I missed cc: to the list. Reposting...
>>
>> --
>> Hi,
>>
>> 2016-04-02 9:28 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
>>>
>>> The code means `Y = *(A + 4)` but it is written as `Y = *A`. This commit
>>> fixes the typo.
>>>
>>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>>> ---
>>>  advsync/memorybarriers.tex | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>>> index ee9312d..b1f49d3 100644
>>> --- a/advsync/memorybarriers.tex
>>> +++ b/advsync/memorybarriers.tex
>>> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>>>  \begin{minipage}[t]{\columnwidth}
>>>  \scriptsize
>>>  \begin{verbatim}
>>> -*A = X; Y = *A;
>>> +*A = X; Y = *(A + 4);
>>
>>
>> I think
>>
>> + *A = X; *(A + 4) = Y;
>>
>> is what meets the possible combination given below.
>>
>> STORE *A = X; STORE *(A + 4) = Y;
>> STORE *(A + 4) = Y; STORE *A = X;
>> STORE {*A, *(A + 4) } = {X, Y};
>
>
> Oops, you're right.  Thank you for let me know.  I will upload modified
> version patch soon.
>
>
> Thanks,
> SeongJae Park
>
>
>>
>> Regards,
>>
>>
>> --
>> Akira Yokosawa <akiysw@gmail.com>
>>
>>
>>>  \end{verbatim}
>>>  \end{minipage}
>>>  \vspace{5pt}
>>> --
>>> 1.9.1
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
