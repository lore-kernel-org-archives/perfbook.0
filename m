Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45633 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750899AbdEFD5k (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 5 May 2017 23:57:40 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v463rZp0057414
 for <perfbook@vger.kernel.org>; Fri, 5 May 2017 23:57:39 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2a8y2v7qms-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 05 May 2017 23:57:39 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 5 May 2017
 23:57:38 -0400
Date: Fri, 5 May 2017 20:57:35 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Q] how to break a concurrent program without proper use of MB
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170505131821.GA13604@master> <20170506114038.GA12643@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170506114038.GA12643@HP>
Message-Id: <20170506035735.GP3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 06, 2017 at 07:40:40PM +0800, Yubin Ruan wrote:
> On Fri, May 05, 2017 at 09:18:21PM +0800, Yubin Ruan wrote:
> > Hi,
> > As mentioned in the perfbook, without proper use of memory barrier, concurrent
> > program will be error prone. For example, in this program:
> > 
> >     int a=0;
> >     int b=0;
> >     
> >     void* T1(void* dummy)
> >     {
> >         a = 1;
> >         b = 1;
> >         return NULL;
> >     }
> >     
> >     void* T2(void* dummy)
> >     {
> >         while(0 == b)
> >             ;
> >         assert(1 == a);
> >         return NULL;
> >     }
> >     
> >     int main()
> >     {
> >         pthread_t threads[2] = {PTHREAD_ONCE_INIT, PTHREAD_ONCE_INIT};
> > 
> >         pthread_create(&threads[0], NULL, T1, NULL);
> >         pthread_create(&threads[1], NULL, T2, NULL);
> > 
> >         pthread_join(threads[0], NULL);
> >         pthread_join(threads[1], NULL);
> > 
> >         return 0;
> >     }
> > 
> > there is chances that the assertion in T2 would fail, because there is no MB used
> > in the program.
> > 
> > However, after testing it so many times, the assertion never get throwed.
> > 
> > Adding a loop to increase the chance:
> > 
> >         for(int i=0; i< 500; i++){
> >             a = b = 0;
> >     
> >             pthread_create(&threads[0], NULL, T1, NULL);
> >             pthread_create(&threads[1], NULL, T2, NULL);
> >     
> >             pthread_join(threads[0], NULL);
> >             pthread_join(threads[1], NULL);
> >         }
> > 
> > the result is the same.
> > 
> > How can I make the assertion fail? Any trick?
> > (and I am using a X64 laptop)
> 
> I think I find the solution. :)
> The problem with the approach above is that on X86/X64
>     "Stores are not reordered with other stores"
> 
> After changing to this schema:
> 
>     processor 1 |  processor 2
>     -------------------------
>     mov [x], 1  | mov [y], 1
>     mov r1, [y] | mov r2, [x]
> 
> I can demonstrate the re-odering issue, because according to the Intel arch'
> manual[1], "Loads may be reordered with older stores to different locations"

Exactly!

The compiler might reorder the stores, but it would be deterministic.

Alternatively, you could run on ARM, PowerPC, IA64, Alpha, or MIPS and
have both loads and stores be reordered.

							Thanx, Paul

> Regards,
> Yubin
> 
> [1]: https://software.intel.com/en-us/articles/intel-sdm
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

