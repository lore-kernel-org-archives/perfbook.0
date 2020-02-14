Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38876 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbgBNAkx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 13 Feb 2020 19:40:53 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so3952448pfc.5
        for <perfbook@vger.kernel.org>; Thu, 13 Feb 2020 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yFiVgfbX7FR1/fv/5gsg81Sw5lvopTNwduS1h6xDWBY=;
        b=rEq2WgJv0wwPUVmDCtxAB928B4vkrFg7DaACxi9+2p17+EWFHWhTGkQYKY4CH6wXIX
         YA8SoNVghXZeh3q/UHlcLtdyjMw3muM05UoymY2oaapywjDZKwdO1VF8i/GH1RU21bSK
         IKQUnK+h0ob0Lr7nCLqKCzkFTd7ldqRMaJ/EKNH8QLLwQTQjNCrAGsEsmvtzHBRhGlft
         yTa3B1qknvkbkMrLYSI3wQiwq5RITOfwdBG7OpdSTazBjLEhh6DJRpdPEfClKz3bSZox
         i4508Iu5z8nyd0y9pPS9PVRwgfjpvNESuRkvFc1ltESsEISoOH1fpi0sdZ8WqGz9QeD5
         pGZA==
Date: Fri, 14 Feb 2020 08:40:34 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: Re: [PATCH] datastruct.tex: fix some minor typos
Message-ID: <20200214004028.GA5058@PhD>
References: <20200212143457.GA25828@PhD>
 <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, junchangwang@gmail.com

On Fri, Feb 14, 2020 at 12:28:24AM +0900, Akira Yokosawa wrote:
>Hi, Junchang,
>
>On Wed, 12 Feb 2020 22:35:15 +0800, Junchang Wang wrote:
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> ---
>> 
>> Hi Paul,
>> 
>> I'm reading the latest version of the perfbook and this patch contains fixes to
>> some typos in Section Data Structures. Hope it helps.
>> 
>> Thanks,
>> --Junchang
>> 
>> --
>>  datastruct/datastruct.tex | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
>> index 4b62471..e21952b 100644
>> --- a/datastruct/datastruct.tex
>> +++ b/datastruct/datastruct.tex
>> @@ -700,7 +700,7 @@ Of course, it is quite possible that the differences in lookup performance
>>  are affected by the differences in update rates.
>>  One way to check this is to artificially throttle the update rates of
>>  per-bucket locking and hazard pointers to match that of RCU.
>> -Doing so does not significantly improve the lookup performace of
>> +Doing so does not significantly improve the lookup performance of
>>  per-bucket locking, nor does it close the gap between hazard pointers
>>  and RCU.
>>  However, removing the read-side memory barriers from hazard pointers
>> @@ -800,8 +800,8 @@ scalability, external consistency, or all of the above.
>>  \section{Non-Partitionable Data Structures}
>>  \label{sec:datastruct:Non-Partitionable Data Structures}
>>  %
>> -\epigraph{Undertake somthing difficult, otherwise you will never grow.}
>> -	 {\emph{Ronald E.~Osburn}}
>> +\epigraph{Undertake something difficult, otherwise you will never grow.}
>> +	 {\emph{Ronald E.~Osborn}}
>>  
>>  \begin{figure}[tb]
>>  \centering
>> @@ -1063,7 +1063,7 @@ Otherwise, a concurrent resize operation has already distributed this
>>  bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
>>  line~\lnref{get_newbkt} selects the bucket corresponding to the key,
>>  and line~\lnref{acq_newbkt} acquires the bucket's lock.
>> -\Clnref{lsp1b}{lsp1e} store the bucket pointer and
>> +\Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and
>
>Thanks for catching this!
>

Hi Akira,

I'm very happy that it helps.

>As far as I see, there is no other error in the use of \clnrefrange/\crefrange
>at the moment.
>To prevent similar typos in the future, I'll add a check of this pattern somewhere
>in the build script.
>

Sounds great!

>        Thanks, Akira
>
>PS:
>
>The email address in the From: field does not match the SOB tag.
>Is this intentional?

Oops. I decided to use the new email address (junchang2020@gmail.com)
to handle emails from mailing lists but forgot to update the SOB message.
Thanks a lot for letting me know this. I'll update my .gitconfig
accordingly and use the new SOB message in the future.


Thanks,
--Junchang


>
>>  pointer-set index into their respective fields in the
>>  \co{ht_lock_state} structure, which again communicates this information to
>>  \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
>> 
