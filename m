Return-Path: <SRS0=TOwi=2N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JLhEkFwtn/Pog+kUnnoQyy+XKiq7E7VyOUgQHn2o68=;
        b=Ee/BrSib18+3i9ZQphsnDggaQZ9B5E3z/oRgYR9YkBUT/LZyznVrikkiQ4Yf4dXtxz
         HtwqAhPuwF74BrjknLjsqucspBz6JpGtvYac1emgyfvoFALsn8mghUHGjAEEvS9HaYFv
         /C8Sqte/e+P+q94kdX5y/LQk3O4oVuKfWMy57lvZFgDiXMi7u8m43XMl/XrkwiDFZ7eh
         D0yIHudwPC9XyRq+JA6asrY8/HLBjOS4PAqROUX1A5Hd1xZ9b//KRyWkQ7rBVlufBjRR
         wrgg8285MqrvlLBmFSwU3sIdto8OjU4fNoKwYzR8Acu/wcv1QFIpUM3BS9FC4UycKfAv
         SGPg==
Message-ID: <599125ce-4fd9-b8dc-8628-197f90513c77@gmail.com>
Date: Wed, 12 Oct 2022 12:19:04 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] memorder.tex: correct the transformed code by compiler.
References: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
 <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Patrick Yingxi Pan <pyxchina92929@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 11 Oct 2022 02:02:08 -0700, Paul E. McKenney wrote:
> On Tue, Oct 11, 2022 at 11:20:49AM +0800, Patrick Yingxi Pan wrote:
>> Hello!
>>
>> I have added the missing READ_ONCE(). Please take a look. Thanks.
>>
>> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> 
> Queued and pushed, thank you!

Paul, somehow Patrick's S-o-b tag is lost in the amended changelog of
commit 520ad603b0f3 ("memorder: Correct the transformed Listing 15.30
code").

I don't think it is mandatory in perfbook, but if you can, please fix
up.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  memorder/memorder.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index a0a87d0a..50ff2882 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
>> the compiler to (incorrectly)
>>  conclude that both pointers are equivalent, when in fact they carry
>>  different dependencies.
>>  This means that the compiler might well transform \clnref{pc} to instead
>> -be \co{r2 = q->c}, which might well cause the value 44 to be loaded
>> +be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
>>  instead of the expected value 144.
>>  \end{fcvref}
>>
>>
>> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
>> --
