Return-Path: <SRS0=E7NT=YR=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=woRh1o5Yiq4vphdawwLDYP7oAnD62tnzvjnPFy9SXaM=;
        b=Him/fhR/iN4AHSItTzCWPj5W5AyyVHc7yyWnlxCH+COegksmemTIbBJzIQ5YJ3ovqN
         Z79nZq1fOfFZ9YETwdPLX89II7rE2yPDR+EBnznNfbxs2UCrJ8yT1Tldlrs7DLZHDG0Y
         dPi9FnjXMb+Z6RE4WFxjghHkYROOq7vypWi3smka/YmzxC2YRkm5S8ze0+KOGFLHGi40
         FJdXkbjr/yzn8OMrv6BqD3JbBCSiYq0uHST8f2gMdC46Hw721R4ORM6fjfdDTW3+4mzx
         bpHo990cwBidOVR2k5q4nrMftKkhFJkO/Y0PJLs4/3yiozd/toUQWMwGb70QQpotutLg
         q/qQ==
Message-ID: <c62b5d02-aa91-2587-c214-1ddbdc863cd3@gmail.com>
Date: Sat, 13 Aug 2022 09:47:44 -0400
MIME-Version: 1.0
Subject: Re: Comments on chapter 5
Content-Language: en-CA
References: <CAJbg=FUxuy++utmmuGpetP2wMk_Hc8UVYu74JWucmw9kxdM57A@mail.gmail.com>
 <20220812010827.GZ2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220812010827.GZ2125313@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

On 2022-08-11 21:08, Paul E. McKenney wrote:
>> 5.3.2: "references only per-thread variables, and should not incur any
>> cache misses" - except that the thread can migrate to other cores and
>> can thus incur cache misses.
> 
> Perhaps adding "in the common case" to that sentence?  Or did you have
> something else in mind?

Pandora, meet can of worms (are mixed metaphors still frowned upon these 
days?).

Do you assume that in the common case threads tend to stick to the same 
core? If so, that's an interesting discussion, as I have changed my mind 
on the subject (or, rather, had the change forced on me) a few times.

--Elad
