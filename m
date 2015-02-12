Return-Path: <namhyung@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;        bh=12k+Uum5/Zy4Yb9kGZnRbbO6HlAVzWcc11o/9oPo2bU=;
 b=oXYY4zDlc9+vSU3f9mkwTG/c2gyeSy3SLK9mN4+E5aYKOcOSfHciPqVK6UxRlSHUts
 nKqAHdf2+9RoffUlpdBXH3hifYmEIEWyJ7y4V0BpLhn0yEGN7+FrHMAMftt+KJuMBFbY
 B0T7iXYKu3VzihgjprC4oVTPtf4tqSva45vPpqkDJGpBNgCSqtTC9Pe6+89oSSqmTDbx
 H0uvqnvudw3eo6+bKc5+ojfHh8vzCp+wMOxvKg4M6xN0mHOgaGFr4T3tZphci6m8/LV9
 UzDDsbJDfWo1+SsIXjvtRsN/0ZUwQWr5vTfmTz0dGWsAF1qdk2CwDLG842aV8468uFBi
 hSsg==
MIME-Version: 1.0
In-Reply-To: <20150210232141.GC4166@linux.vnet.ibm.com>
References: <20150210014240.GA6334@danjae>
 <20150210232141.GC4166@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@gmail.com>
Date: Fri, 13 Feb 2015 08:16:25 +0900
Message-ID: 
 <CAM9d7cjtK-p=U5JM8kj2vHNYwPYfrMnXPLCNC4yiGSjogaeS_g@mail.gmail.com>
Subject: Re: rcu_read_unlock() in the nestable rcu based on free-running
 counter
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Wed, Feb 11, 2015 at 8:21 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, Feb 10, 2015 at 10:42:40AM +0900, Namhyung Kim wrote:
>> Hi,
>>
>> It says "Interestingly enough, the implementation of rcu_read_unlock()
>> is identical to that shown in Section 'RCU based on free-running
>> counter'".  However it seems not.. ;-)
>
> Indeed!  How about the following?  (And good catch, by the way!)
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> Interestingly enough, despite their rcu_read_lock() differences, the
> implementation of rcu_read_unlock() is broadly similar to that shown in
> Section 9.3.5.7.

Looks good to me!

Thanks,
Namhyung

