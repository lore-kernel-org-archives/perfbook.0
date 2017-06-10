Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=xh2gxgm6Z5LWjRNMQr+pIo6+64QVyMDXfoRJzqD9oys=;
 b=NX+WYvzSc0dzD83jNCEIQtZbpRAIUcinZww8vi0Q9NFCYo/1RRSjRVXPPLwFQCh1i+
 N3PNHHBleanAkOBo6iXi3Df7Y9uJeQF+E0+visVLO07ysYSo4G3BC6iOoJxqr8ZUXT86
 SlTLy1cxbaZgsCwS3UlSuMmajzHnOq70rHooWrK9XvztzOegBzPVAN6dBIt4+lUyTK+Z
 9PcjwJb/cNhBw3z6HPf1CmiTpxYdpmYKlq+DMERGa9h89+5V4E8esY8X+6hScbSJ7WJQ
 Tk54eubDnonhPuHKIboxp/evyayTFMUX/uSB+8cz1XyC2hrW+NKVMqoBLCGYGI4xh5B0
 EoEQ==
MIME-Version: 1.0
In-Reply-To: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
References: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sat, 10 Jun 2017 22:35:25 +0800
Message-ID: 
 <CABoNC8005C3wF7vv_y_6mnkTUwAKZ+hr9cgL1-RjJfXo9VHZDg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Update on Chapter Deferred Processing
Content-Type: text/plain; charset="UTF-8"
To: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

 Hi Paul,

The fourth patch is a false alarm. So I won't send it out. Please
review and apply patches 1 - 3. Thanks.


--Jason

On Sat, Jun 10, 2017 at 10:28 PM, Junchang Wang <junchangwang@gmail.com> wrote:
> Hi Paul,
>
> I'm reading Chapter Deferred Processing, and following are some patches. Please
> take a look.
>
> --Jason
>
> Junchang Wang (4):
>   Figure Storage Hazard-Pointer Storage and Erasure: Switch from
>     ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>   route_hazptr: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>   route_seqlock: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>
>  CodeSamples/defer/route_hazptr.c  | 10 +++++-----
>  CodeSamples/defer/route_seqlock.c |  6 +++---
>  CodeSamples/defer/seqlock.h       |  4 ++--
>  defer/hazptr.tex                  | 16 ++++++++--------
>  defer/seqlock.tex                 | 12 ++++++------
>  5 files changed, 26 insertions(+), 26 deletions(-)
>
> --
> 2.7.4
>

