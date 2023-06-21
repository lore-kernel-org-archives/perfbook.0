Return-Path: <SRS0=fbDN=CJ=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687321571; x=1689913571;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XE43wJsb93RPJOGCTCvQVV1bDyrrCwmiTLBR5W4VDO4=;
        b=F6k/CW2A8IxnG9TYu+KqRhHA2wtrYKYpz8M3FU/+5U1tnPZ9bl4kiRRCxFL6+yj0Cf
         HVML4QIwTP73JZefw3BQzMQtDuoJDWt4PQL1zRF8huP5kzjC738zDyi3eJWPgasladcO
         5celTvT3sI4Vr9HcZyVm/ec6lP/pEuOP1VUDal10SRy7/cIYw1ln6EFP9RuGa7PcY2WG
         BLUkuy+3+Una1w5EtwZCFj5UM+JbWMZu37vrN1xGnE6HvHFjLGXtWMp3e/j2uTzhzyXN
         mDQ98zAMurdm8iEDduSyhI7BtyDRgIWswFto34GK+gUTFUCHDkZOH40zwgjU8bTbloPa
         FILw==
Message-ID: <e6b02dffe91fdc670cb4ccfc3460f22b024a3e58.camel@gmail.com>
Subject: Re: [PATCH] CodeSamples/tree: Fix compiler warning on free
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 21 Jun 2023 01:26:07 -0300
In-Reply-To: <bbb2031b-dba8-43b1-bc98-99394aec12c1@paulmck-laptop>
References: <20230616063903.207676-3-leobras.c@gmail.com>
	 <e90e329664670a8b92a64970310be2ff92b41301.camel@gmail.com>
	 <bbb2031b-dba8-43b1-bc98-99394aec12c1@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, 2023-06-20 at 15:40 -0700, Paul E. McKenney wrote:
> On Mon, Jun 19, 2023 at 11:13:32PM -0300, Leonardo Bras wrote:
> > On Fri, 2023-06-16 at 03:39 -0300, Leonardo Bras wrote:
> > > While building the CodeSamples/datastruct/Issaquah/ directory, I can
> > > see
> > > a couple instances of this warning:
> > >=20
> > > In function =E2=80=98free_treenode_cache=E2=80=99,
> > > =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98tree_remove_all=E2=80=99 at =
tree.c:102:2,
> > > =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98tree_free=E2=80=99 at tree.c=
:128:2:
> > > tree.c:251:9: warning: =E2=80=98free=E2=80=99 called on pointer =E2=
=80=98trp=E2=80=99 with nonzero
> > > offset 96 [-Wfree-nonheap-object]
> > > =C2=A0 251 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(tnp=
);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~
> > >=20
> > > I took a look and tried to understand what was happening:
> > > - tree_remove_all() calls free_treenode_cache() on it's input, which
> > > ends
> > > =C2=A0 up free()'ing it (!BAD_MALLOC)
> > > - It makes sense in most treenodes, since they are allocated with
> > > =C2=A0 alloc_treenode_cache() and the malloc() output is the same as =
the
> > > free()
> > > =C2=A0 input.
> > > - tree_free() calls tree_remove_all() on &trp->max, which ends up
> > > trying
> > > =C2=A0 to free() this same address.
> > > - trp is a struct treeroot, which is composed of 2 treenodes: min &
> > > max
> > > - The output of malloc() for trp ends up being different from the
> > > address
> > > =C2=A0 used for free(), since &trp->max is used instead, and there is=
 an
> > > offset
> > > =C2=A0 since max is the second element of struct treeroot.
> > >=20
> > > To solve this while keeping the tree_remove_all() generic, move
> > > struct traceroot->max to be the first element, and guarantee the
> > > address
> > > used for free() is the same returned by malloc().
> >=20
> > Extra info:
> >=20
> > Bug reproduction:
> > https://gitlab.com/linux-kernel/perfbook/-/jobs/4501216686#L212
> >=20
> > With bugfix provided in this patch:
> > https://gitlab.com/linux-kernel/perfbook/-/jobs/4485986705
>=20
> Hello, Leo, and apologies for being slow.
>=20
> My feeling is that there is a deeper bug involving use of the wrong
> pointer, as in freeing a pointer to a field of the enclosing structure.

That's correct.
I have proposed a hack, which works even though the code is still 'incorrec=
t'.

The thing is that the current code calls tree_remove_all() for &trp->max wh=
ich
was malloc'ed as a struct treeroot, unlike the other treenodes, and yet wil=
l try
to free trp->max.

> What are your thoughts on adjusting things so that the correct pointer
> is freed?  (And no, I have not yet looked at this closely, so there
> might well be a very good reason why my suggestion is bogus.  But I have
> to ask!)

Sure, it's possible to do that.
I will create a helper _tree_remove_all() that does everything except remov=
e the
treenode, and call that on trp->max @ tree_free(), as the trp itself is fre=
ed
soon after.

Then I will call _tree_remove_all() + free_treenode_cache() at=20
tree_remove_all(). This should make sure everything is right.

It's a longer change, and I was unsure of how much would be ok to change in=
 that
code, but I am happy to provide v2 like this.

I will send the v2 soon.

Thanks,
Leo


>=20
> 							Thanx, Paul
>=20
> > Thanks,
> > Leo
> >=20
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > ---
> > > =C2=A0CodeSamples/datastruct/Issaquah/tree.h | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/CodeSamples/datastruct/Issaquah/tree.h
> > > b/CodeSamples/datastruct/Issaquah/tree.h
> > > index f007558a..bbe5e7c1 100644
> > > --- a/CodeSamples/datastruct/Issaquah/tree.h
> > > +++ b/CodeSamples/datastruct/Issaquah/tree.h
> > > @@ -48,8 +48,8 @@ struct treenode {
> > > =C2=A0 * Root of a tree.
> > > =C2=A0 */
> > > =C2=A0struct treeroot {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode min;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode max;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct treenode min;
> > > =C2=A0} __attribute__((__aligned__(CACHE_LINE_SIZE)));
> > > =C2=A0
> > > =C2=A0void treenode_wire_call_rcu(void);
> >=20
>=20
>=20

