Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=jxtC5XEDZ+HWAigHVnidg0TP69UgXziwbfyUSwccwNQ=;
 b=YwKzgkfY/THiFtYSKU+mU6eokAZMlS5HTZwI6rXU9h6ufhIJ+0v3AFErKZdnR5ezYe
 JM7n7jUUyyinQNtmBZ4iMauH7JuGEGbRqVHSB/LOBfv8VlFA5XET8wNog/OWSV8xLpNG
 4XQ6BM7WW5jiqa6cITkBICKnltwarm1IzXGeGv0joyNd3Guzpr/3FLDjSxcW5ASQxgDr
 IPTXvCrOjCK4AeZZsfGqVo9B82KP4Qj03aYaKgRoTz5zIi8QJzIyDDoigorYTG666Yf3
 gCQMhUQI+9lokUkUtb+VewfO4FlxP73Qj6D6FDJ0GckxR/4pxtZ9yucwuocYe5T1zJVY
 r5jQ==
MIME-Version: 1.0
In-Reply-To: <20160519003350.GG3528@linux.vnet.ibm.com>
References: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
 <20160519003350.GG3528@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Thu, 19 May 2016 09:35:15 +0900
Message-ID: 
 <CAEjAshpT1X-nhz_8WiboQ9R6Uz1w7NbVqgnE=+nv6R8nL=Pn0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] locking: fixup trivial nitpicks
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, May 19, 2016 at 9:33 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, May 19, 2016 at 07:53:58AM +0900, SeongJae Park wrote:
>> This patchset contains fixup of trivial nitpickes that found during translation
>> of locking/ directory.
>
> Queued and pushed, thank you!
>
> On future submissions, could you please capitalize the word in the
> subject line following the ":", as shown below?  (I have been fixing
> them manually.)

Ok, I will!


Thanks,
SeongJae Park

>
>                                                         Thanx, Paul
>
>> SeongJae Park (2):
>>   locking: use consistent expressions
>     locking: Use consistent expressions
>>   locking: fix typos
>     locking: Fix typos
>>
>>  locking/locking.tex | 38 +++++++++++++++++++-------------------
>>  1 file changed, 19 insertions(+), 19 deletions(-)
>>
>> --
>> 1.9.1
>>
>

