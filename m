Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et0onfdesDVIuPO4zjCchdaQUTdJ8g4ADD1VqLNGxrw=;
        b=bm6oFgMXTj3iNkVSWZXtJA32dCPk1cKyU1YS0BhBEg0dTClp/O/5Wm9ZxtU7whuOQg
         fTMRSWpZDYITeUajiSQ5PA5tehEhCzim2kRg4keB6xX+7n3EQE+rTtKZCX4HTC3kK4Rq
         akq1jZCQvCrpYYX0ob1yObQcI1I7LVSA96FexjU1s6FO02UqJ8uDtwXAbn7bMvhtcq7K
         RLz2KV3OXqYNPOf7j7VHAJBsfqTVDJ1iRJqOmjDqYtd7GrdmacbGdBDG5eCLKS3p2mZI
         22fnTBj8mwiRbxGV1EG1mME/jJBBrFFD67iGmjgXUVTgC6/3ETIaLnHj/BMn5yTLVZu4
         WFsg==
MIME-Version: 1.0
References: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
 <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com> <20181001175117.GF4222@linux.ibm.com>
In-Reply-To: <20181001175117.GF4222@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Thu, 4 Oct 2018 23:01:00 +0800
Message-ID: <CABoNC81Lsi6sC8MCh2T0KrKnt+c1QAVNOm7+601GuRqd8OVopg@mail.gmail.com>
Subject: Re: Fwd: Other architectures we can work on?
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Thanks a lot! OSU has approved my application and provisioned a PPC
server for me. Now I can start testing code on PPC :-). For the ARM
server, the application is still in progress. I'll let you know if
there are any updates.


Thank!
--JunchangOn Tue, Oct 2, 2018 at 1:51 AM Paul E. McKenney
<paulmck@linux.ibm.com> wrote:
>
> On Mon, Oct 01, 2018 at 11:23:17AM +0800, Junchang Wang wrote:
> > Forward to list perfbook since the last mail was blocked due to the
> > non-plain-text issue.
> >
> >
> > Hi Paul and list,
> >
> > I'm again reading the excellent 15th chapter (Advanced
> > Synchronization), which helps me eventually understand how a
> > hardware/compiler can optimize--and hence ``break''-- my parallelized
> > code :-).
> >
> > I really want to get my hands dirty and to test my code and samples in
> > perfbook on real servers. However, all servers in my lab are x86. I
> > wonder if there is any chance that we can have access to architectures
> > other than x86 to test code. For example, are there any cloud service
> > that provides access to POWER or ARM architecture?
>
> For POWER access for academic or open-source projects, please see here:
>
> https://osuosl.org/services/powerdev/request_hosting/
>
> There are said to be similar services for ARM, for example:
>
> https://thenewstack.io/cncf-packet-team-provide-free-infrastructure-cloud-developers
>
> Please let me know how it goes!
>
>                                                         Thanx, Paul
>

