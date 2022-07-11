import { NextFunction, Request, Response, Router } from 'express';
import * as pg from 'pg';
import { Service } from 'typedi';
import { DatabaseService } from '../services/database.service';


@Service()
export class DatabaseController {
    public constructor(private databaseService: DatabaseService) {}

    public get router(): Router {
        const router: Router = Router();

        const multer = require('multer');
        const storage = multer.diskStorage({
            destination:function(req:any, file:any, cb:any) {
            cb(null, './assets/profile-pics')
            },
            filename: function(req:any, file:any, cb:any) {
                cb(null, file.originalname)
            }
        })

        const upload = multer({ storage: storage})

        // this.router.post('/image', upload.single('image'), async (req: Request, res: Response) => {});

        // ======= GENERAL ROUTES =======

        router.get('/users/:email', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getUSerInfos(req.params.email)
                .then((result: pg.QueryResult) => {res.json(result.rows), console.log(result.rows)})
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.get('/image/:email', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getLinkPhoto(req.params.email)
                .then((result: pg.QueryResult) => {console.log(result.rows[0].profile_pic), res.download(result.rows[0].profile_pic)})
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.patch('/users/:email', (req: Request, res: Response, next: NextFunction) => {
            console.log(req.body);
            const update = { new: req.body, old: {email: req.params.email} }
            this.databaseService
                .updateNewsOptions('users', update)
                .then((result: pg.QueryResult) => res.json(result.rowCount))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(405).json(e.stack);
                });
        });
        
        router.post('/image', upload.single('image'), (req: Request, res: Response, next: NextFunction) => {
            res.status(200).json('OK');
        });
        
        router.post('/users', (req: Request, res: Response, next: NextFunction) => {
            console.log(req.body);
            this.databaseService
                .create('users', req.body)
                .then((result: pg.QueryResult) => res.json(result.rowCount))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(405).json(e.stack);
                });
        });

        

        /*router.get('/tables', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getTablesList()
                .then((result: pg.QueryResult) => res.json(result.rows))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.get('/tables/:tableName', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getTable(req.params.tableName, req.query)
                .then((result: pg.QueryResult) => res.json(result.rows))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.get('/tables/:tableName/primary-key', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getTablePrimaryKeys(req.params.tableName)
                .then((result: pg.QueryResult) => res.json(result.rows))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.get('/tables/:tableName/foreign-key', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getTableForeignKey(req.params.tableName)
                .then((result: pg.QueryResult) => res.json(result.rows))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.get('/tables/:tableName/types', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .getTableColumnsTypes(req.params.tableName)
                .then((result: pg.QueryResult) => res.json(result.rows))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(404).json(e.stack);
                });
        });

        router.delete('/tables/:tableName', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .remove(req.params.tableName, req.body)
                .then((result: pg.QueryResult) => res.json(true))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(405).json(e.stack);
                });
        });

        router.post('/tables/:tableName', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .create(req.params.tableName, req.body)
                .then((result: pg.QueryResult) => res.json(result.rowCount))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(405).json(e.stack);
                });
        });

        router.put('/tables/:tableName', (req: Request, res: Response, next: NextFunction) => {
            this.databaseService
                .change(req.params.tableName, req.body)
                .then((result: pg.QueryResult) => res.json(result.rowCount))
                .catch((e: Error) => {
                    console.error(e.stack);
                    res.status(405).json(e.stack);
                });
        });
        */

        return router;
    }
}
