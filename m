Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35991 "EHLO
 mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1750828AbcDBCws (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 1
 Apr 2016 22:52:48 -0400
Received: by mail-pa0-f65.google.com with SMTP id 1so14655076pal.3 for
 <perfbook@vger.kernel.org>; Fri, 01 Apr 2016 19:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=y6sZALNJfQDZ5muxHjG3OQlCzsfPJ8c1XIdpBrlEzwo=;
 b=SrRCek5lAak0MOgA3QQ2p1aXt/DpAC04UtZsJv4n7+9maZOlYFBEpilqW1AMK7X5n+
 48HU0GfTU8sMy5fPFj/ao74B2rYVRxY1b/JC3KhJJGpVAMz3vKtLmsWiXtRl14R1Fq7U
 T1JrPDnaX5sVnzWhWDBarUfcZeec1KAz4XFn6Yc5p0u790Rre1FAYahq/ildi0uIMqkT
 BFvrbms6ZgWK52IKLLXcSoh9+lttMfYy/KKW4sTv8NKNDp65GvFl3JXEV6H3OK6FED18
 FQxBsm4Hq4skI986eLW05oMdd5KHmA8tfvmorHqu2zqFnOZVTNCakmPchYpk0dOlaKQG
 bcWQ==
From: SeongJae Park <sj38.park@gmail.com>
Date: Sat, 2 Apr 2016 11:52:40 +0900 (KST)
Subject: Re: [PATCH 4/6] advsync: fix wrong code example
In-Reply-To: 
 <CADj5ksQFv7pCx1WLdWRtNQwff7LBg+BspASL5dhbJAJVC2qeUQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1604021149350.22948@hxeon>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-5-git-send-email-sj38.park@gmail.com>
 <CADj5ksQFv7pCx1WLdWRtNQwff7LBg+BspASL5dhbJAJVC2qeUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yokosawa Akira <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

Hi,

On Sat, 2 Apr 2016, Yokosawa Akira wrote:

> Sorry, I missed cc: to the list. Reposting...
>
> -- 
> Hi,
>
> 2016-04-02 9:28 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
>> The code means `Y = *(A + 4)` but it is written as `Y = *A`. This commit
>> fixes the typo.
>>
>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>> ---
>>  advsync/memorybarriers.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index ee9312d..b1f49d3 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>>  \begin{minipage}[t]{\columnwidth}
>>  \scriptsize
>>  \begin{verbatim}
>> -*A = X; Y = *A;
>> +*A = X; Y = *(A + 4);
>
> I think
>
> + *A = X; *(A + 4) = Y;
>
> is what meets the possible combination given below.
>
> STORE *A = X; STORE *(A + 4) = Y;
> STORE *(A + 4) = Y; STORE *A = X;
> STORE {*A, *(A + 4) } = {X, Y};

Oops, you're right.  Thank you for let me know.  I will upload modified
version patch soon.


Thanks,
SeongJae Park

>
> Regards,
>
>
> --
> Akira Yokosawa <akiysw@gmail.com>
>
>
>>  \end{verbatim}
>>  \end{minipage}
>>  \vspace{5pt}
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
