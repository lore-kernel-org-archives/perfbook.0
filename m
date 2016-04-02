Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35902 "EHLO
 mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751607AbcDBDMs (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 1
 Apr 2016 23:12:48 -0400
Received: by mail-lb0-f173.google.com with SMTP id qe11so85692363lbc.3 for
 <perfbook@vger.kernel.org>; Fri, 01 Apr 2016 20:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=9/OqumqoMzLyZhmm+Y0m/6xfgqD+YSgM3+ZrxKZIOsM=;
 b=QeQI9GLimnK65I00qeAiBhbS5STHZrKWj1KJ9aja4NPe9O5ZXKCuk/UHOH+huY9kf8
 xBA+Hfyj70PRwDegIxxhiODKrSMWO6TCWrTfrVvJICbiZ6EajzSGRqHGhM2L73k4Dvcd
 ktopTNzJYBLnoDuka31WrF/6Ov0WMKbySTG24tU4sls5OYFzk/7j8bm0yTOPN/8QEza8
 0KQmdxGbGXBzTK59xZ2cwnmF3v3L8mwQS1FN2SfYXTGAbB1qyQbdEO29enxRd5D0f2Vr
 r77omsfYI9WE0vIRUGsGqR+m5cSeMCtV95W4saHniuvtwAdkdVmnj3PnHqxmhIdLPjhS
 dQjw==
MIME-Version: 1.0
In-Reply-To: 
 <CADj5ksQtF0fNB7oPrT5JYq5hA1nieEo-UaVCif4g-TgN52DY+g@mail.gmail.com>
References: <alpine.DEB.2.10.1604021149350.22948@hxeon>
 <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
 <CADj5ksQtF0fNB7oPrT5JYq5hA1nieEo-UaVCif4g-TgN52DY+g@mail.gmail.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Sat, 2 Apr 2016 12:12:17 +0900
Message-ID: 
 <CAEjAsho95S5snF=GxTmNvEiEZUbj3EmPnteZZHZJcRY2OHw6Cw@mail.gmail.com>
Subject: Re: [PATCH] advsync: fix wrong code example
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yokosawa Akira <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 2, 2016 at 12:09 PM, Yokosawa Akira <akiyks@gmail.com> wrote:
> Oh, You have already added the tag.

Yes, I think you deserve it, of course. :)


Thanks,
SeongJae Park

> Thanks!
>
> 2016-04-02 12:03 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
>> The code means `*(A + 4) = Y` but it is written as `Y = *A`. This commit
>> fixes the typo.
>>
>> Suggested-by: Akira Yokosawa <akiysw@gmail.com>
>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>> ---
>>  advsync/memorybarriers.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index ee9312d..8e9c876 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>>  \begin{minipage}[t]{\columnwidth}
>>  \scriptsize
>>  \begin{verbatim}
>> -*A = X; Y = *A;
>> +*A = X; *(A + 4) = Y;
>>  \end{verbatim}
>>  \end{minipage}
>>  \vspace{5pt}
>> --
>> 1.9.1
>>
