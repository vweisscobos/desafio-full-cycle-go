FROM golang as stage

WORKDIR /usr/src/

COPY . .

RUN go build full-cycle-rocks.go

FROM scratch

WORKDIR /usr/src/

COPY --from=stage /usr/src/ ./

CMD [ "./full-cycle-rocks" ]

