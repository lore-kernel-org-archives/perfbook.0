Return-Path: <SRS0=qHCL=3H=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NVms/Hujgy3iBLDYYqqASyLYLfshlhKFd9qr1FjL5Ug=;
        b=pOotilBb7PSEt7oaeOfxV3yYXHYsQugDke6V9OmCPGbGEkCxhYrhLffawTmkqnqFZi
         wfYaD6tnXHWEIsYHdz8XmMY7pEQfR+H4ldwhRM9oErjq9kzRezTqNGGPNpZmUZiuSsNq
         6nXh7w9ymdzwWOcrUsa2S0S0WO7s4sHFqGUddiqgWw8t/RE5rHMs0CE3KDbyGSWV9Jdh
         sRxSmdtYIuhkZH6Wkk/roQbMufmzPZ84f2g5tQGtbNK824fkYfH2kslfHbbUa6WSvv/C
         hvUenw98UA/iaw+OGtVAyH4LLATiAGBcowS6a6YowL+Vu8EEaYLQ5HVROt+eWVbVYJkK
         h2iw==
Subject: Re: [PATCH 2/3] howto: Fix typo
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
 <7d340ee9-e333-67f5-863f-9d81fbf068db@gmail.com>
 <20200117033608.GD2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8ec9dd6b-429b-a777-b453-a979c050805b@gmail.com>
Date: Sat, 18 Jan 2020 19:52:29 +0900
MIME-Version: 1.0
In-Reply-To: <20200117033608.GD2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 16 Jan 2020 19:36:08 -0800, Paul E. McKenney wrote:
> On Fri, Jan 17, 2020 at 06:59:10AM +0900, Akira Yokosawa wrote:
>> >From cd352d3dfd20d8fcfdddafe5547ad191cbdda37e Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 13 Jan 2020 16:18:19 +0900
>> Subject: [PATCH 2/3] howto: Fix typo
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I took the other two, thank you very much!
> 
> I treated this one as a bug report, again, thank you!  Please see below
> for the corresponding commit.  Thoughts?

Please find inline comments below.

> 
> 							Thanx, Paul
> 
>> ---
>>  howto/howto.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/howto/howto.tex b/howto/howto.tex
>> index bbdacbf1..fe80cca8 100644
>> --- a/howto/howto.tex
>> +++ b/howto/howto.tex
>> @@ -23,7 +23,7 @@ Parallel programming is not as hard as some say, and we hope
>>  that this book makes your parallel-programming projects easier and
>>  more fun.
>>  
>> -In short, where parallel programming once focused on science, research,
>> +In short, while parallel programming once focused on science, research,
>>  and grand-challenge projects, it is quickly becoming an engineering
>>  discipline.
>>  We therefore examine specific parallel-programming tasks
>> -- 
>> 2.17.1
> 
> ------------------------------------------------------------------------
> 
> commit b094718ddbe4256e606a41c660b4d4f1836baa66
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Thu Jan 16 19:31:26 2020 -0800
> 
>     howto: Word parallel-programming-as-engineering less obscurely
>     
>     The "where ... once ... becoming" wording might be legal English, it
>     is a bit obscure and less than friendly to those whose native language
>     is not English.  This commit therefore rewrites the offending paragraph.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index bbdacbf..8a93774 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -23,11 +23,12 @@ Parallel programming is not as hard as some say, and we hope
>  that this book makes your parallel-programming projects easier and
>  more fun.
>  
> -In short, where parallel programming once focused on science, research,
> -and grand-challenge projects, it is quickly becoming an engineering
> -discipline.
> -We therefore examine specific parallel-programming tasks
> -and describe how to approach them.
> +In short, the focus of parallel programming is quickly shifting away
> +from science, research, and grand-challenge projects.
> +And this is all to the good, because it means that parallel programming
> +is finally becoming an engineering discipline.
> +Therefore, as befits an engineering discipline, this book examines
> +specific parallel-programming tasks and describes how to approach them.
>  In some surprisingly common cases, they can even be automated.

Well, nowadays, you can try "google translate".
It recognizes the use of "where" as a subordinate conjunction in the
original paragraph.

I don't know why such a use case of "where" is not on my dictionary...

And saying "shifting away from" could be misleading because "science,
research, and grand-challenge projects" are still driving parallel
programming.

So maybe it might be better to revert this change, or to rephrase some more.

        Thanks, Akira

>  
>  This book is written in the hope that presenting the engineering
> 
